#!/usr/bin/env python3
"""
数据库结构对比脚本
对比 mydx_20230402 (MySQL) 和 fzzh (Kingbase) 的表结构差异
"""

import json
import subprocess
import sys
from typing import Dict, List, Any

DBCLI = "/home/dreamsoft/code/other/DBChat/dbcli-cli/target/dbcli-cli"

def run_query(ds: str, schema: str, sql: str, max_rows: int = 1000) -> List[Dict]:
    """执行 SQL 查询并返回结果（分页获取所有数据）"""
    all_data = []
    offset = 0
    page_size = 1000

    while True:
        paginated_sql = f"{sql} LIMIT {page_size} OFFSET {offset}"
        cmd = [DBCLI, "sql", "query", "--ds", ds, "--schema", schema, paginated_sql, "--json", "--maxRows", str(page_size)]
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            print(f"Error executing query: {result.stderr}")
            break
        try:
            data = json.loads(result.stdout)
            rows = data.get("data", {}).get("data", [])
            if not rows:
                break
            all_data.extend(rows)
            if len(rows) < page_size:
                break
            offset += page_size
        except json.JSONDecodeError:
            break

    return all_data

def get_mysql_columns() -> List[Dict]:
    """获取 MySQL 所有 g_ 和 idm_ 开头表的字段信息"""
    sql = """
    SELECT
        TABLE_NAME as table_name,
        COLUMN_NAME as column_name,
        COLUMN_TYPE as column_type,
        IS_NULLABLE as is_nullable,
        COLUMN_DEFAULT as column_default,
        COLUMN_COMMENT as column_comment,
        ORDINAL_POSITION as position
    FROM information_schema.COLUMNS
    WHERE TABLE_SCHEMA = 'mydx_20230402'
    AND (TABLE_NAME LIKE 'g_%' OR TABLE_NAME LIKE 'idm_%')
    ORDER BY TABLE_NAME, ORDINAL_POSITION
    """
    return run_query("mydx", "mydx_20230402", sql, 20000)

def get_kingbase_columns() -> List[Dict]:
    """获取 Kingbase 所有 g_ 和 idm_ 开头表的字段信息"""
    sql = """
    SELECT
        table_name,
        column_name,
        data_type,
        character_maximum_length,
        numeric_precision,
        numeric_scale,
        is_nullable,
        column_default,
        ordinal_position as position
    FROM information_schema.columns
    WHERE table_schema = 'fzzh'
    AND (table_name LIKE 'g_%' OR table_name LIKE 'idm_%')
    ORDER BY table_name, ordinal_position
    """
    return run_query("kingbase-test", "fzzh", sql, 25000)

def normalize_type(mysql_type: str, kingbase_type: str, kb_len: Any, kb_prec: Any, kb_scale: Any) -> tuple:
    """标准化类型进行比较，返回 (mysql_norm, kingbase_norm)"""
    mysql_lower = mysql_type.lower()

    # MySQL 类型标准化
    mysql_norm = mysql_lower

    # Kingbase 类型标准化 (需要根据 data_type 和长度构建完整类型)
    kb_type_lower = kingbase_type.lower() if kingbase_type else ""

    if kb_type_lower in ('character varying', 'varchar'):
        kb_len_val = kb_len if kb_len else ''
        kb_norm = f"varchar({kb_len_val})" if kb_len_val else "varchar"
    elif kb_type_lower in ('character', 'char'):
        kb_len_val = kb_len if kb_len else ''
        kb_norm = f"char({kb_len_val})" if kb_len_val else "char"
    elif kb_type_lower in ('numeric', 'decimal'):
        if kb_prec and kb_scale:
            kb_norm = f"decimal({kb_prec},{kb_scale})"
        elif kb_prec:
            kb_norm = f"decimal({kb_prec})"
        else:
            kb_norm = "decimal"
    elif kb_type_lower == 'integer':
        kb_norm = "int"
    elif kb_type_lower == 'bigint':
        kb_norm = "bigint"
    elif kb_type_lower == 'smallint':
        kb_norm = "smallint"
    elif kb_type_lower == 'double precision':
        kb_norm = "double"
    elif kb_type_lower == 'timestamp without time zone':
        kb_norm = "timestamp"
    elif kb_type_lower == 'timestamp with time zone':
        kb_norm = "timestamp"
    elif kb_type_lower == 'date':
        kb_norm = "date"
    elif kb_type_lower == 'time without time zone':
        kb_norm = "time"
    elif kb_type_lower == 'boolean':
        kb_norm = "tinyint(1)"
    elif kb_type_lower == 'text':
        kb_norm = "text"
    elif kb_type_lower == 'blob':
        kb_norm = "blob"
    elif kb_type_lower == 'longblob':
        kb_norm = "longblob"
    elif kb_type_lower == 'mediumblob':
        kb_norm = "mediumblob"
    else:
        kb_norm = kb_type_lower

    return (mysql_norm, kb_norm)

def normalize_default(default: Any) -> str:
    """标准化默认值"""
    if default is None:
        return "NULL"
    default_str = str(default).strip()
    # 移除 MySQL 和 Kingbase 默认值的引号差异
    if default_str.upper() in ('NULL', 'NULL', ''):
        return "NULL"
    # 移除函数调用周围的括号差异
    if default_str.startswith('(') and default_str.endswith(')'):
        default_str = default_str[1:-1]
    return default_str.upper()

def compare_columns(mysql_cols: List[Dict], kingbase_cols: List[Dict]) -> Dict[str, List[Dict]]:
    """对比两边的字段差异"""
    # 构建 MySQL 字段映射: table -> column -> info
    mysql_map: Dict[str, Dict[str, Dict]] = {}
    for col in mysql_cols:
        table = col['table_name'].lower()
        column = col['column_name'].lower()
        if table not in mysql_map:
            mysql_map[table] = {}
        mysql_map[table][column] = col

    # 构建 Kingbase 字段映射
    kb_map: Dict[str, Dict[str, Dict]] = {}
    for col in kingbase_cols:
        table = col['table_name'].lower()
        column = col['column_name'].lower()
        if table not in kb_map:
            kb_map[table] = {}
        kb_map[table][column] = col

    # 只检查两边共有的表
    common_tables = set(mysql_map.keys()) & set(kb_map.keys())

    differences: Dict[str, List[Dict]] = {}

    for table in sorted(common_tables):
        mysql_cols_table = mysql_map[table]
        kb_cols_table = kb_map[table]

        # 只检查两边共有的字段
        common_columns = set(mysql_cols_table.keys()) & set(kb_cols_table.keys())

        table_diffs = []

        for column in sorted(common_columns):
            mysql_col = mysql_cols_table[column]
            kb_col = kb_cols_table[column]

            # 类型对比
            mysql_type = mysql_col['column_type']
            kb_type_raw = kb_col['data_type']
            kb_len = kb_col.get('character_maximum_length')
            kb_prec = kb_col.get('numeric_precision')
            kb_scale = kb_col.get('numeric_scale')

            mysql_norm, kb_norm = normalize_type(mysql_type, kb_type_raw, kb_len, kb_prec, kb_scale)

            # 默认值对比
            mysql_default = mysql_col.get('column_default')
            kb_default = kb_col.get('column_default')

            mysql_default_norm = normalize_default(mysql_default)
            kb_default_norm = normalize_default(kb_default)

            # 是否可空对比
            mysql_nullable = mysql_col['is_nullable'].upper() == 'YES'
            kb_nullable = kb_col['is_nullable'].upper() == 'YES'

            # 记录差异
            diffs = []

            # 1. 类型差异 (需要考虑 MySQL 到 Kingbase 的类型转换)
            # 注意：类型差异是正常的（转换工具会转换类型），这里只记录明显错误
            if mysql_norm != kb_norm:
                # 检查是否是合理的类型转换
                reasonable_mappings = {
                    ('int', 'integer'), ('bigint', 'bigint'), ('smallint', 'smallint'),
                    ('varchar', 'varchar'), ('char', 'char'),
                    ('text', 'text'), ('timestamp', 'timestamp'),
                    ('date', 'date'), ('datetime', 'timestamp'),
                    ('decimal', 'decimal'), ('double', 'double precision'),
                    ('tinyint(1)', 'boolean'),
                }
                is_reasonable = False
                for m, k in reasonable_mappings:
                    if mysql_norm.startswith(m.split('(')[0]) and kb_norm.startswith(k.split('(')[0]):
                        is_reasonable = True
                        break
                if not is_reasonable:
                    diffs.append({
                        'type': 'type_diff',
                        'mysql': mysql_type,
                        'kingbase': f"{kb_type_raw}({kb_len or kb_prec or ''})",
                        'mysql_norm': mysql_norm,
                        'kingbase_norm': kb_norm
                    })

            # 2. 默认值差异 - MySQL 有但 Kingbase 没有 (这是主要问题)
            if mysql_default_norm != "NULL" and kb_default_norm == "NULL":
                diffs.append({
                    'type': 'default_missing',
                    'mysql_default': mysql_default,
                    'mysql_default_norm': mysql_default_norm
                })

            # 3. 默认值不同
            elif mysql_default_norm != "NULL" and mysql_default_norm != kb_default_norm:
                diffs.append({
                    'type': 'default_diff',
                    'mysql_default': mysql_default,
                    'kingbase_default': kb_default,
                    'mysql_default_norm': mysql_default_norm,
                    'kingbase_default_norm': kb_default_norm
                })

            # 4. nullable 差异
            if mysql_nullable != kb_nullable:
                diffs.append({
                    'type': 'nullable_diff',
                    'mysql_nullable': mysql_nullable,
                    'kingbase_nullable': kb_nullable
                })

            if diffs:
                table_diffs.append({
                    'column': column,
                    'mysql_type': mysql_type,
                    'kingbase_type': kb_norm,
                    'mysql_nullable': mysql_nullable,
                    'kingbase_nullable': kb_nullable,
                    'mysql_default': mysql_default,
                    'kingbase_default': kb_default,
                    'diffs': diffs
                })

        if table_diffs:
            differences[table] = table_diffs

    return differences

def generate_alter_sql(differences: Dict[str, List[Dict]]) -> str:
    """生成 Kingbase ALTER TABLE SQL"""
    sql_lines = []

    sql_lines.append("-- =====================================================")
    sql_lines.append("-- fzzh (Kingbase) 表结构修复 SQL")
    sql_lines.append("-- 基于 mydx_20230402 (MySQL) 源数据库")
    sql_lines.append("-- =====================================================")
    sql_lines.append("")
    sql_lines.append("-- 注意: 执行前请先备份相关表")
    sql_lines.append("-- 执行方式: 在 Kingbase 数据库中逐条执行")
    sql_lines.append("")

    # 分类统计
    default_missing_count = 0
    default_diff_count = 0
    type_diff_count = 0
    nullable_diff_count = 0

    for table, cols in sorted(differences.items()):
        sql_lines.append(f"-- ==================== 表: {table} ====================")

        for col_info in cols:
            column = col_info['column']
            kingbase_type = col_info['kingbase_type']
            mysql_default = col_info['mysql_default']
            kingbase_nullable = col_info['kingbase_nullable']

            for diff in col_info['diffs']:
                diff_type = diff['type']

                if diff_type == 'default_missing':
                    default_missing_count += 1
                    # 生成设置默认值的 SQL
                    default_val = mysql_default
                    # 处理默认值格式
                    if default_val and not default_val.upper().startswith('CURRENT_'):
                        # 字符串默认值需要加引号
                        if "'" not in default_val and not default_val.isdigit() and not default_val.upper() in ('NULL', 'TRUE', 'FALSE'):
                            default_val = f"'{default_val}'"
                    sql_lines.append(f"-- 字段 {column}: 缺少默认值")
                    sql_lines.append(f"ALTER TABLE {table} ALTER COLUMN {column} SET DEFAULT {default_val};")
                    sql_lines.append("")

                elif diff_type == 'default_diff':
                    default_diff_count += 1
                    default_val = diff['mysql_default']
                    if default_val and not default_val.upper().startswith('CURRENT_'):
                        if "'" not in default_val and not default_val.isdigit() and not default_val.upper() in ('NULL', 'TRUE', 'FALSE'):
                            default_val = f"'{default_val}'"
                    sql_lines.append(f"-- 字段 {column}: 默认值不一致")
                    sql_lines.append(f"-- MySQL: {diff['mysql_default']}, Kingbase: {diff['kingbase_default']}")
                    sql_lines.append(f"ALTER TABLE {table} ALTER COLUMN {column} SET DEFAULT {default_val};")
                    sql_lines.append("")

                elif diff_type == 'type_diff':
                    type_diff_count += 1
                    sql_lines.append(f"-- 字段 {column}: 类型不一致")
                    sql_lines.append(f"-- MySQL: {diff['mysql']}, Kingbase: {diff['kingbase']}")
                    sql_lines.append(f"-- 注意: 类型修改可能导致数据丢失，请谨慎处理")
                    # 不自动生成 ALTER TYPE SQL，因为可能需要数据转换
                    sql_lines.append(f"-- ALTER TABLE {table} ALTER COLUMN {column} TYPE {diff['mysql_norm']};")
                    sql_lines.append("")

                elif diff_type == 'nullable_diff':
                    nullable_diff_count += 1
                    sql_lines.append(f"-- 字段 {column}: nullable 不一致")
                    sql_lines.append(f"-- MySQL nullable: {diff['mysql_nullable']}, Kingbase nullable: {diff['kingbase_nullable']}")
                    if diff['mysql_nullable'] and not diff['kingbase_nullable']:
                        sql_lines.append(f"ALTER TABLE {table} ALTER COLUMN {column} DROP NOT NULL;")
                    else:
                        sql_lines.append(f"-- ALTER TABLE {table} ALTER COLUMN {column} SET NOT NULL;")
                    sql_lines.append("")

    # 添加统计信息
    sql_lines.insert(5, f"-- 统计信息:")
    sql_lines.insert(6, f"--   默认值缺失: {default_missing_count} 个字段")
    sql_lines.insert(7, f"--   默认值不同: {default_diff_count} 个字段")
    sql_lines.insert(8, f"--   类型不同: {type_diff_count} 个字段")
    sql_lines.insert(9, f"--   nullable 不同: {nullable_diff_count} 个字段")
    sql_lines.insert(10, f"--   共涉及 {len(differences)} 个表")
    sql_lines.insert(11, "")

    return "\n".join(sql_lines)

def generate_report(differences: Dict[str, List[Dict]]) -> str:
    """生成 Markdown 格式的差异报告"""
    report_lines = []

    report_lines.append("# 数据库结构对比报告")
    report_lines.append("")
    report_lines.append("## 概述")
    report_lines.append("")
    report_lines.append(f"- 源数据库: mydx_20230402 (MySQL)")
    report_lines.append(f"- 目标数据库: fzzh (Kingbase)")
    report_lines.append(f"- 检查范围: g_ 和 idm_ 开头的表")
    report_lines.append(f"- 发现差异表数: {len(differences)}")
    report_lines.append("")

    # 分类统计
    categories = {
        'default_missing': {'count': 0, 'desc': '默认值缺失'},
        'default_diff': {'count': 0, 'desc': '默认值不同'},
        'type_diff': {'count': 0, 'desc': '类型不同'},
        'nullable_diff': {'count': 0, 'desc': 'nullable 不同'},
    }

    for table, cols in differences.items():
        for col_info in cols:
            for diff in col_info['diffs']:
                categories[diff['type']]['count'] += 1

    report_lines.append("## 问题统计")
    report_lines.append("")
    report_lines.append("| 问题类型 | 数量 |")
    report_lines.append("|----------|------|")
    for cat_type, cat_info in categories.items():
        report_lines.append(f"| {cat_info['desc']} | {cat_info['count']} |")
    report_lines.append("")

    report_lines.append("## 详细差异列表")
    report_lines.append("")

    for table, cols in sorted(differences.items()):
        report_lines.append(f"### 表: {table}")
        report_lines.append("")
        report_lines.append("| 字段 | MySQL 类型 | Kingbase 类型 | MySQL 默认值 | Kingbase 默认值 | 问题 |")
        report_lines.append("|------|------------|---------------|--------------|-----------------|------|")

        for col_info in cols:
            column = col_info['column']
            mysql_type = col_info['mysql_type']
            kb_type = col_info['kingbase_type']
            mysql_default = col_info['mysql_default'] or 'NULL'
            kb_default = col_info['kingbase_default'] or 'NULL'

            problems = []
            for diff in col_info['diffs']:
                if diff['type'] == 'default_missing':
                    problems.append('默认值缺失')
                elif diff['type'] == 'default_diff':
                    problems.append('默认值不同')
                elif diff['type'] == 'type_diff':
                    problems.append('类型不同')
                elif diff['type'] == 'nullable_diff':
                    problems.append('nullable不同')

            report_lines.append(f"| {column} | {mysql_type} | {kb_type} | {mysql_default} | {kb_default} | {', '.join(problems)} |")

        report_lines.append("")

    return "\n".join(report_lines)

def main():
    print("正在获取 MySQL 字段信息...")
    mysql_cols = get_mysql_columns()
    print(f"MySQL 字段数: {len(mysql_cols)}")

    print("正在获取 Kingbase 字段信息...")
    kingbase_cols = get_kingbase_columns()
    print(f"Kingbase 字段数: {len(kingbase_cols)}")

    print("正在对比字段差异...")
    differences = compare_columns(mysql_cols, kingbase_cols)
    print(f"发现差异表数: {len(differences)}")

    # 保存结果
    output_dir = "/home/dreamsoft/code/other/dbcli"

    # 生成 SQL
    sql = generate_alter_sql(differences)
    sql_file = f"{output_dir}/fix_kingbase_structure.sql"
    with open(sql_file, 'w', encoding='utf-8') as f:
        f.write(sql)
    print(f"修复 SQL 已保存到: {sql_file}")

    # 生成报告
    report = generate_report(differences)
    report_file = f"{output_dir}/diff_report.md"
    with open(report_file, 'w', encoding='utf-8') as f:
        f.write(report)
    print(f"差异报告已保存到: {report_file}")

    # 保存原始数据
    with open(f"{output_dir}/mysql_columns.json", 'w', encoding='utf-8') as f:
        json.dump(mysql_cols, f, ensure_ascii=False, indent=2)
    with open(f"{output_dir}/kingbase_columns.json", 'w', encoding='utf-8') as f:
        json.dump(kingbase_cols, f, ensure_ascii=False, indent=2)

if __name__ == "__main__":
    main()
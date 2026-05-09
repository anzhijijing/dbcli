---
name: dbcli
description: |
  Database CLI tool for AI agents. Use this skill when the user asks about database operations:
  schema exploration, table structure, column information, SQL execution, database metadata,
  datasource management, index information, foreign keys, table statistics, DDL viewing,
  SQL validation, SQL formatting, execution plan analysis.
  
  Supports: MySQL, PostgreSQL, DaMeng (达梦), Kingbase (人大金仓).
  
  Trigger on: database queries, table structure, schema exploration, SQL execution, 
  column info, database metadata, table description, DDL viewing, index information, 
  foreign keys, add datasource, test database connection, list tables, search tables,
  search columns, SQL validation, explain SQL, 达梦, dm, dameng, 金仓, kingbase, 人大金仓,
  国产数据库, Chinese database.
---

# DBCLI - AI-Friendly Database CLI

面向 AI Agent 的数据库 CLI 工具，提供安全、高效的数据库操作能力。

## 工具位置

```bash
# Native Image (推荐，8ms 启动)
DBCLI="/home/mc/code/other/DBChat/dbcli-cli/target/dbcli-cli"

# JAR (需要 Java 17+)
DBCLI_JAR="/home/mc/code/other/DBChat/dbcli-cli/target/dbcli-cli-1.0.0-SNAPSHOT-jar-with-dependencies.jar"

# 使用方式
$DBCLI <command> [options]  # 使用 Native Image
java -jar $DBCLI_JAR <command> [options]  # 使用 JAR
```

## 输出格式

始终使用 `--json` 输出，便于解析：
- 添加 `--json` 或 `--output json` 参数

成功响应：
```json
{
  "success": true,
  "data": { ... }
}
```

错误响应：
```json
{
  "success": false,
  "errorCode": "...",
  "message": "..."
}
```

## 资源路径格式

```
datasource                    # 一段式（数据源）
datasource.schema             # 二段式（Schema）
datasource.schema.table       # 三段式（表）
datasource.schema.table.column  # 四段式（字段）
```

示例：
- `local-mysql` - 数据源
- `local-mysql.ms_base` - Schema
- `local-mysql.ms_base.base_user` - 表
- `local-mysql.ms_base.base_user.username` - 字段

---

## 命令完整列表

### 1. datasource - 数据源管理

添加、查看、测试、删除数据源连接。

| 命令 | 说明 | 示例 |
|------|------|------|
| `datasource add` | 添加数据源 | `$DBCLI datasource add <name> --type mysql --host <host> --port 3306 --database <db> --username <user> --password <pwd> --json` |
| `datasource list` | 列出所有数据源 | `$DBCLI datasource list --json` |
| `datasource get` | 获取数据源详情 | `$DBCLI datasource get <name> --json` |
| `datasource remove` | 移除数据源 | `$DBCLI datasource remove <name>` |
| `datasource ping` | 测试连接 | `$DBCLI datasource ping <name> --json` |

**datasource add 参数：**
- `--type` - 数据库类型：mysql, postgresql, dm (达梦), kingbase (人大金仓)
- `--host` - 主机地址
- `--port` - 端口（可选，mysql 默认 3306，postgresql 默认 5432，dm 默认 5236，kingbase 默认 54321）
- `--database/-d` - 数据库名
- `--username/-u` - 用户名
- `--password/-p` - 密码
- `--url` - 自定义 JDBC URL（可选，替代 host/port/database）

**示例：**
```bash
# 添加 MySQL 数据源
$DBCLI datasource add local-mysql \
  --type mysql \
  --host 192.168.1.40 \
  --port 3306 \
  --database ms_base \
  --username root \
  --password root --json

# 添加 PostgreSQL 数据源
$DBCLI datasource add local-pg \
  --type postgresql \
  --host localhost \
  --port 5432 \
  --database mydb \
  --username postgres \
  --password postgres --json

# 添加 DaMeng (达梦) 数据源
$DBCLI datasource add dm-test \
  --type dm \
  --host 192.168.1.35 \
  --port 5236 \
  --database JZS \
  --username jzs \
  --password password --json

# 添加 Kingbase (人大金仓) 数据源
$DBCLI datasource add kingbase-test \
  --type kingbase \
  --host 192.168.1.35 \
  --port 54322 \
  --database fzzh \
  --username dream \
  --password password --json

# 测试连接
$DBCLI datasource ping local-mysql --json
# 输出: {"success":true,"data":"connected"}

# 列出所有数据源
$DBCLI datasource list --json
# 输出: {"success":true,"data":[{"name":"local-mysql","type":"mysql","host":"192.168.1.40",...}]}
```

---

### 2. schema - Schema 管理

查看数据库中的 Schema 信息。

| 命令 | 说明 | 示例 |
|------|------|------|
| `schema list` | 列出 Schema | `$DBCLI schema list --ds <datasource> --json` |
| `schema get` | 获取 Schema 详情 | `$DBCLI schema get <datasource.schema> --json` |
| `schema search` | 搜索 Schema | `$DBCLI schema search <keyword> --ds <datasource> --json` |

**示例：**
```bash
# 列出所有 Schema
$DBCLI schema list --ds local-mysql --json

# 获取 Schema 详情
$DBCLI schema get local-mysql.ms_base --json

# 搜索包含 "base" 的 Schema
$DBCLI schema search base --ds local-mysql --json
```

---

### 3. table - 表管理

查看表结构、DDL、索引、外键、统计信息。

| 命令 | 说明 | 示例 |
|------|------|------|
| `table list` | 列出表 | `$DBCLI table list --ds <ds> [--schema <schema>] [--keyword <kw>] --json` |
| `table desc` | 查看表结构 | `$DBCLI table desc <ds.schema.table> --json` |
| `table search` | 搜索表 | `$DBCLI table search <keyword> --ds <ds> [--schema <schema>] --json` |
| `table ddl` | 查看表 DDL | `$DBCLI table ddl <ds.schema.table>` |
| `table stats` | 查看统计信息 | `$DBCLI table stats <ds.schema.table> --json` |
| `table index` | 查看索引 | `$DBCLI table index <ds.schema.table> --json` |
| `table fk` | 查看外键 | `$DBCLI table fk <ds.schema.table> --json` |

**示例：**
```bash
# 列出所有表
$DBCLI table list --ds local-mysql --schema ms_base --json

# 搜索包含 "user" 的表
$DBCLI table search user --ds local-mysql --schema ms_base --json

# 查看表结构（字段、类型、注释等）
$DBCLI table desc local-mysql.ms_base.base_user --json

# 查看表的创建 DDL
$DBCLI table ddl local-mysql.ms_base.base_user

# 查看表统计信息（行数、数据大小、索引大小）
$DBCLI table stats local-mysql.ms_base.base_user --json

# 查看表的索引
$DBCLI table index local-mysql.ms_base.base_user --json

# 查看表的外键关系
$DBCLI table fk local-mysql.ms_base.base_order --json
```

---

### 4. column - 字段管理

搜索和查看字段详情。

| 命令 | 说明 | 示例 |
|------|------|------|
| `column search` | 搜索字段 | `$DBCLI column search <keyword> --ds <ds> [--schema <schema>] --json` |
| `column list` | 列出表字段 | `$DBCLI column list <ds.schema.table> --json` |
| `column get` | 获取字段详情 | `$DBCLI column get <ds.schema.table.column> --json` |

**示例：**
```bash
# 搜索包含 "id" 的字段
$DBCLI column search id --ds local-mysql --schema ms_base --json

# 列出表的所有字段
$DBCLI column list local-mysql.ms_base.base_user --json

# 查看字段详情
$DBCLI column get local-mysql.ms_base.base_user.username --json
```

---

### 5. sql - SQL 操作

执行查询、校验、格式化、分析执行计划。

| 命令 | 说明 | 示例 |
|------|------|------|
| `sql query` | 执行 SQL 查询 | `$DBCLI sql query --ds <ds> [--schema <schema>] "<sql>" --json` |
| `sql validate` | 校验 SQL 安全性 | `$DBCLI sql validate "<sql>" --json` |
| `sql format` | 格式化 SQL | `$DBCLI sql format "<sql>"` |
| `sql explain` | 分析执行计划 | `$DBCLI sql explain --ds <ds> [--schema <schema>] "<sql>" --json` |

**sql query 参数：**
- `--ds` - 数据源名称（必填）
- `--schema` - Schema 名称（可选）
- `--maxRows` - 最大返回行数（默认 1000）

**示例：**
```bash
# 执行查询
$DBCLI sql query --ds local-mysql --schema ms_base \
  "SELECT * FROM base_user WHERE status = 'active' LIMIT 10" --json

# 校验 SQL（安全检查）
$DBCLI sql validate "DELETE FROM base_user WHERE id = 1" --json
# 输出: {"success":true,"data":{"valid":true,"sqlType":"DELETE",...}}

$DBCLI sql validate "DELETE FROM base_user" --json
# 输出: {"success":true,"data":{"valid":false,"errorCode":"NO_WHERE_CLAUSE",...}}

# 格式化 SQL
$DBCLI sql format "select id,name from user where id=1"
# 输出: SELECT id, name FROM user WHERE id = 1

# 分析执行计划
$DBCLI sql explain --ds local-mysql --schema ms_base \
  "SELECT * FROM base_user WHERE username = 'admin'" --json
```

---

### 6. search - 全局搜索

跨数据库对象搜索。

| 命令 | 说明 | 示例 |
|------|------|------|
| `search` | 全局搜索 | `$DBCLI search <keyword> --ds <ds> [--type <type>] [--comment] --json` |

**参数：**
- `--ds` - 数据源名称（必填）
- `--type` - 搜索类型：all, schema, table, column（默认 all）
- `--comment` - 包含注释内容搜索

**示例：**
```bash
# 全局搜索 "user"
$DBCLI search user --ds local-mysql --json

# 仅搜索表
$DBCLI search user --ds local-mysql --type table --json

# 仅搜索字段
$DBCLI search id --ds local-mysql --type column --json

# 搜索包含注释
$DBCLI search 订单 --ds local-mysql --comment --json
```

---

## 安全特性

### SQL 校验规则

| 规则 | 说明 |
|------|------|
| DROP DATABASE | 禁止 |
| DROP SCHEMA | 禁止 |
| TRUNCATE | 禁止 |
| UPDATE 无 WHERE | 禁止 |
| DELETE 无 WHERE | 禁止 |
| SELECT | 行数限制（默认 1000） |

### 配置限制

- `maxRows`: 1000（最大返回行数）
- `timeout`: 30s（查询超时）

---

## 配置文件

数据源配置存储在 `~/.dbcli/config.yaml`：

```yaml
datasources:
  local-mysql:
    type: mysql
    host: 192.168.1.40
    port: 3306
    database: ms_base
    username: root
    password: root
  dm-test:
    type: dm
    host: 192.168.1.35
    port: 5236
    database: JZS
    username: jzs
    password: password
    url: jdbc:dm://192.168.1.35:5236/JZS?ClientEncoding=unicode
  kingbase-test:
    type: kingbase
    host: 192.168.1.35
    port: 54322
    database: fzzh
    username: dream
    password: password
    url: jdbc:kingbase8://192.168.1.35:54322/fzzh?currentSchema=fzzh
```

**国产数据库连接说明：**

| 数据库 | 默认端口 | JDBC URL 格式 | 特殊参数 |
|--------|----------|---------------|----------|
| DaMeng (达梦) | 5236 | `jdbc:dm://host:port/database` | `ClientEncoding=unicode` 推荐添加 |
| Kingbase (人大金仓) | 54321 | `jdbc:kingbase8://host:port/database` | `currentSchema=schema` 可指定默认 Schema |

---

## 常用操作速查表

| 需求 | 命令 |
|------|------|
| 添加数据源 | `datasource add <name> --type mysql --host <host> --port 3306 --database <db> --username <user> --password <pwd> --json` |
| 添加达梦数据源 | `datasource add <name> --type dm --host <host> --port 5236 --database <db> --username <user> --password <pwd> --json` |
| 添加金仓数据源 | `datasource add <name> --type kingbase --host <host> --port 54321 --database <db> --username <user> --password <pwd> --json` |
| 测试连接 | `datasource ping <name> --json` |
| 列出数据源 | `datasource list --json` |
| 列出 Schema | `schema list --ds <ds> --json` |
| 列出表 | `table list --ds <ds> --schema <schema> --json` |
| 查看表结构 | `table desc <ds>.<schema>.<table> --json` |
| 查看表 DDL | `table ddl <ds>.<schema>.<table>` |
| 查看索引 | `table index <ds>.<schema>.<table> --json` |
| 查看外键 | `table fk <ds>.<schema>.<table> --json` |
| 查看统计 | `table stats <ds>.<schema>.<table> --json` |
| 搜索表 | `table search <keyword> --ds <ds> --schema <schema> --json` |
| 搜索字段 | `column search <keyword> --ds <ds> --schema <schema> --json` |
| 列出字段 | `column list <ds>.<schema>.<table> --json` |
| 执行 SQL | `sql query --ds <ds> --schema <schema> "<sql>" --json` |
| 校验 SQL | `sql validate "<sql>" --json` |
| 格式化 SQL | `sql format "<sql>"` |
| 分析执行计划 | `sql explain --ds <ds> --schema <schema> "<sql>" --json` |
| 全局搜索 | `search <keyword> --ds <ds> --json` |

---

## 国产数据库示例

### DaMeng (达梦) 示例

```bash
# 查看达梦数据库 Schema
$DBCLI schema list --ds dm-test --json

# 查看达梦表列表
$DBCLI table list --ds dm-test --schema JZS --json

# 查看达梦表结构
$DBCLI table desc dm-test.JZS.sys_user --json

# 在达梦执行 SQL
$DBCLI sql query --ds dm-test --schema JZS \
  "SELECT * FROM sys_user WHERE status = 1 LIMIT 10" --json
```

### Kingbase (人大金仓) 示例

```bash
# 查看金仓数据库 Schema
$DBCLI schema list --ds kingbase-test --json

# 查看金仓表列表
$DBCLI table list --ds kingbase-test --schema fzzh --json

# 查看金仓表结构
$DBCLI table desc kingbase-test.fzzh.t_user --json

# 在金仓执行 SQL
$DBCLI sql query --ds kingbase-test --schema fzzh \
  "SELECT * FROM t_user WHERE is_active = true LIMIT 10" --json
```

---

## 工作流程建议

1. **探索阶段**: 
   - 先用 `datasource list` 查看可用数据源
   - 用 `schema list` 查看 Schema
   - 用 `table list` 和 `table desc` 了解表结构

2. **查询阶段**: 
   - 用 `column search` 找到相关字段
   - 用 `sql validate` 校验 SQL 安全性
   - 用 `sql query` 执行具体查询

3. **分析阶段**: 
   - 用 `table stats` 查看表统计
   - 用 `table index` 分析索引
   - 用 `sql explain` 分析执行计划
# DBCLI SPEC V1.0

## 项目名称

```text id="8dxyvk"
dbcli
```

---

# 1. 项目定位

`dbcli` 是一个：

```text id="rq8sl2"
面向 AI Agent 的数据库 CLI Runtime
```

用于向：

* Claude Code
* Cline
* Cursor
* OpenAI Agent
* MCP Client
* 自定义 Agent

提供：

* 数据库元数据获取
* schema 检索
* 模糊搜索
* SQL 执行
* 结构化数据操作
* 数据库安全控制

能力。

---

# 2. 设计目标

## 2.1 AI-Friendly

CLI 必须：

* 无状态
* 显式参数
* 不依赖上下文
* 输出稳定
* 可 JSON 化
* 可脚本化
* 可 Tool Calling

---

## 2.2 多数据库支持

第一阶段支持：

| 数据库        | 驱动           |
| ---------- | ------------ |
| MySQL      | JDBC         |
| PostgreSQL | JDBC         |
| KingbaseES | PostgreSQL兼容 |
| 达梦 DM8     | JDBC         |

后续：

* Oracle
* SQLServer
* SQLite
* OceanBase
* ClickHouse

---

## 2.3 安全优先

必须：

* SQL AST 校验
* 危险 SQL 拦截
* UPDATE/DELETE 安全检查
* 行数限制
* timeout
* schema 白名单

---

# 3. 技术架构

---

# 3.1 架构图

```text id="rjlwm4"
+------------------------------------------------+
|              AI Agent / MCP Client             |
+----------------------+-------------------------+
                       |
                       v
+------------------------------------------------+
|                    dbcli                       |
|------------------------------------------------|
| command parser                                 |
| metadata engine                                |
| dialect adapter                                |
| sql validator                                  |
| execution engine                               |
| formatter                                      |
+----------------------+-------------------------+
                       |
                       v
+------------------------------------------------+
|                JDBC / SPI Layer                |
+----------------------+-------------------------+
                       |
      +----------------+---------------+
      |                                |
      v                                v
   MySQL                          PG/Kingbase/DM
```

---

# 4. 技术栈

| 技术              | 用途      |
| --------------- | ------- |
| Java 17         | 主语言     |
| Picocli         | CLI框架   |
| JLine           | Shell   |
| HikariCP        | 连接池     |
| Jackson         | JSON    |
| JSqlParser      | SQL AST |
| SLF4J + Logback | 日志      |
| Maven           | 构建      |

---

# 5. CLI 命令规范

---

# 5.1 资源路径规范

统一资源路径：

---

## 三段式

```text id="h8yijx"
datasource.schema.table
```

示例：

```text id="z0g1dq"
local-mysql.public.t_user
```

---

## 四段式

```text id="vpd7pt"
datasource.schema.table.column
```

示例：

```text id="r9rkt7"
local-mysql.public.t_user.username
```

---

# 5.2 全局参数

| 参数                | 说明     |
| ----------------- | ------ |
| --ds              | 数据源    |
| --schema          | schema |
| --output          | 输出格式   |
| --page            | 页码     |
| --size            | 分页大小   |
| --timeout         | 超时     |
| --non-interactive | 非交互    |
| --json            | JSON输出 |

---

# 5.3 输出格式

支持：

| 格式    | 用途       |
| ----- | -------- |
| table | 默认       |
| json  | AI推荐     |
| yaml  | 配置       |
| md    | markdown |

---

# 6. 命令定义

---

# 6.1 datasource

---

## 添加数据源

```bash id="d7o5io"
dbcli datasource add local-mysql
```

---

## 列出数据源

```bash id="2lbr6k"
dbcli datasource list
```

---

## 查看数据源

```bash id="ek1htg"
dbcli datasource get local-mysql
```

---

## 删除数据源

```bash id="o6wj91"
dbcli datasource remove local-mysql
```

---

## 测试连接

```bash id="u9q2rq"
dbcli datasource ping local-mysql
```

---

# 6.2 schema

---

## 列出 schema

```bash id="5f6v1w"
dbcli schema list --ds local-mysql
```

---

## 查看 schema

```bash id="wjlwm1"
dbcli schema get local-mysql.public
```

---

## 搜索 schema

```bash id="1xol2r"
dbcli schema search order --ds local-mysql
```

---

# 6.3 table

---

## 列出表

```bash id="9e4v1n"
dbcli table list --ds local-mysql --schema public
```

---

## 搜索表

```bash id="rb9m5n"
dbcli table search order --ds local-mysql --schema public
```

---

## 查看表结构

```bash id="0s9mvf"
dbcli table desc local-mysql.public.t_user
```

---

## 查看DDL

```bash id="zjwxwk"
dbcli table ddl local-mysql.public.t_user
```

---

## 查看统计信息

```bash id="rj42zo"
dbcli table stats local-mysql.public.t_user
```

---

## 查看依赖

```bash id="5uy1gl"
dbcli table refs local-mysql.public.t_order
```

---

# 6.4 column

---

## 搜索字段

```bash id="v11kv4"
dbcli column search username --ds local-mysql
```

---

## 查看字段

```bash id="s4wjlwm"
dbcli column get local-mysql.public.t_user.username
```

---

## 列出字段

```bash id="7a1h6t"
dbcli column list local-mysql.public.t_user
```

---

# 6.5 index

---

## 查看索引

```bash id="crksdb"
dbcli index list local-mysql.public.t_user
```

---

# 6.6 fk

---

## 查看外键

```bash id="9g0rjlwm"
dbcli fk list local-mysql.public.t_order
```

---

# 6.7 data（推荐 AI 使用）

---

## 查询数据

```bash id="jjlwm8"
dbcli data select local-mysql.public.t_user
```

---

## 条件查询

```bash id="y61kfe"
dbcli data select local-mysql.public.t_user \
  --where "id=1"
```

---

## 插入数据

```bash id="ztjlwm"
dbcli data insert local-mysql.public.t_user \
  --data '{"name":"test"}'
```

---

## 更新数据

```bash id="l0cew1"
dbcli data update local-mysql.public.t_user \
  --where "id=1" \
  --data '{"name":"new"}'
```

---

## 删除数据

```bash id="hqecwv"
dbcli data delete local-mysql.public.t_user \
  --where "id=1"
```

---

# 6.8 sql

---

## 执行 SQL

```bash id="gohjlwm"
dbcli sql query \
  --ds local-mysql \
  --schema public \
  "select * from t_user limit 10"
```

---

## explain SQL

```bash id="qnjlwm"
dbcli sql explain \
  --ds local-mysql \
  --schema public \
  "select * from t_user"
```

---

## analyze SQL

```bash id="3gr8tp"
dbcli sql analyze \
  --ds local-mysql \
  --schema public \
  "select * from t_user"
```

---

## SQL 校验

```bash id="nuxn1x"
dbcli sql validate \
  --ds local-mysql \
  "delete from user"
```

---

## SQL 格式化

```bash id="a8fjlwm"
dbcli sql format \
  "select * from user"
```

---

# 6.9 search

---

## 全局搜索

```bash id="1jlwmf"
dbcli search order --ds local-mysql
```

---

## 搜索字段

```bash id="0bjlwm"
dbcli search username \
  --type column \
  --ds local-mysql
```

---

## 搜索注释

```bash id="b8i8i0"
dbcli search 用户 \
  --comment \
  --ds local-mysql
```

---

# 6.10 export

---

## 导出 schema

```bash id="8c5jlwm"
dbcli export schema \
  --ds local-mysql \
  --schema public
```

---

## 导出单表

```bash id="0yjlwm"
dbcli export table local-mysql.public.t_user
```

---

## 紧凑导出

```bash id="wvjlwm"
dbcli export schema \
  --compact
```

---

# 6.11 cache

---

## 刷新缓存

```bash id="y9jlwm"
dbcli cache refresh
```

---

## 缓存状态

```bash id="vjlwmx"
dbcli cache stats
```

---

# 6.12 doctor

---

## 环境诊断

```bash id="jlwm21"
dbcli doctor
```

检查：

* JDBC 驱动
* 网络
* 连接
* Java版本

---

# 7. 输出规范

---

# 7.1 JSON 输出

示例：

```json id="qjlwm9"
{
  "success": true,
  "data": []
}
```

---

# 7.2 错误输出

```json id="jlwm88"
{
  "success": false,
  "errorCode": "TABLE_NOT_FOUND",
  "message": "table not found"
}
```

---

# 7.3 AI 稳定输出要求

必须：

* 字段顺序固定
* 时间格式统一 ISO8601
* 不输出随机文本
* 不输出 ANSI 色彩（json模式）

---

# 8. 数据结构

---

# 8.1 TableMeta

```java id="jlwm7x"
public class TableMeta {

    private String datasource;

    private String schema;

    private String tableName;

    private String comment;

    private List<ColumnMeta> columns;

}
```

---

# 8.2 ColumnMeta

```java id="jlwm1q"
public class ColumnMeta {

    private String name;

    private String type;

    private String comment;

    private boolean nullable;

    private boolean primaryKey;

}
```

---

# 9. 数据库抽象层

---

# 9.1 DatabaseDialect

```java id="jlwmwx"
public interface DatabaseDialect {

    String type();

    List<String> listSchemas(Connection conn);

    List<TableMeta> listTables(
        Connection conn,
        String schema,
        String keyword
    );

    TableMeta getTableMeta(
        Connection conn,
        String schema,
        String table
    );

    List<ColumnMeta> searchColumns(
        Connection conn,
        String keyword
    );

    SqlValidateResult validateSql(String sql);

}
```

---

# 9.2 SPI

```java id="jlwm7z"
public interface DatabaseProvider {

    String type();

    Driver driver();

    DatabaseDialect dialect();

}
```

---

# 10. SQL 安全

---

# 10.1 SQL Parser

使用：

```text id="jlwm5m"
JSqlParser
```

---

# 10.2 禁止 SQL

默认禁止：

```sql id="jlwm0m"
DROP DATABASE
TRUNCATE
```

---

# 10.3 UPDATE/DELETE 安全

默认要求：

* WHERE
* LIMIT（部分数据库）

---

# 10.4 查询限制

默认：

| 配置      | 默认值  |
| ------- | ---- |
| maxRows | 1000 |
| timeout | 30s  |

---

# 11. 配置文件

路径：

```text id="jlwm2m"
~/.dbcli/config.yaml
```

---

# 示例

```yaml id="jlwm3m"
datasources:
  local-mysql:
    type: mysql
    host: 127.0.0.1
    port: 3306
    database: test
    username: root
    password: xxx
```

---

# 12. 推荐目录结构

```text id="jlwm4m"
dbcli/
 ├── dbcli-cli
 ├── dbcli-core
 ├── dbcli-jdbc
 ├── dbcli-security
 ├── dbcli-dialect-api
 ├── dbcli-dialect-mysql
 ├── dbcli-dialect-pg
 ├── dbcli-dialect-kingbase
 ├── dbcli-dialect-dm
 └── docs
```

---

# 13. MVP 范围

---

# 第一阶段必须实现

## 数据源

* add
* list
* ping

---

## schema/table

* schema list
* table list
* table desc
* column search

---

## sql

* query
* validate

---

## 输出

* table
* json

---

## 数据库

* mysql
* postgres

---

# 14. 后续规划

---

# V1.1

* 达梦
* Kingbase
* explain
* analyze

---

# V1.2

* MCP Server
* HTTP API
* Web UI

---

# V2.0

* lineage
* schema diff
* snapshot
* RBAC
* 审计日志

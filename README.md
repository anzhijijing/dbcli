# DBCLI - AI-Friendly Database CLI Runtime

面向 AI Agent 的数据库 CLI 工具，提供数据库元数据获取、SQL 执行和安全控制能力。

## 快速开始

### 使用 Native Image（推荐）

```bash
# 直接运行，无需 Java 环境
./dbcli-cli/target/dbcli-cli --help
./dbcli-cli/target/dbcli-cli sql query --ds local-mysql --schema ms_base "SELECT * FROM user LIMIT 10" --json
```

### 使用 JAR

```bash
java -jar dbcli-cli/target/dbcli-cli-1.0.0-SNAPSHOT-jar-with-dependencies.jar --help
```

## 性能对比

| 方式 | 启动时间 | 文件大小 | 环境要求 |
|------|---------|---------|---------|
| Native Image | **8ms** | 66MB | 无需 JVM |
| JAR | 224ms | 10.9MB | Java 17+ |

Native Image 启动速度比 JAR 快 **28 倍**。

## 构建

### JAR 构建

```bash
mvn package -DskipTests
```

### Native Image 构建

需要 GraalVM 21+：

```bash
# 安装 GraalVM (可选)
cd ~/.jdks
curl -L -o graalvm.tar.gz "https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-21.0.2/graalvm-community-jdk-21.0.2_linux-x64_bin.tar.gz"
tar -xzf graalvm.tar.gz

# 构建 Native Image
JAVA_HOME=~/.jdks/graalvm-community-openjdk-21.0.2+13.1 mvn -Pnative package -DskipTests
```

## 使用示例

### 1. 数据源管理

```bash
# 添加数据源
dbcli datasource add local-mysql \
  --type mysql \
  --host 192.168.1.40 \
  --port 3306 \
  --database ms_base \
  --username root \
  --password root

# 测试连接
dbcli datasource ping local-mysql

# 列出数据源
dbcli datasource list --json
```

### 2. Schema 操作

```bash
# 列出 schema
dbcli schema list --ds local-mysql --json

# 查看 schema 详情
dbcli schema get local-mysql.ms_base --json
```

### 3. Table 操作

```bash
# 列出表
dbcli table list --ds local-mysql --schema ms_base --json

# 查看表结构
dbcli table desc local-mysql.ms_base.base_user --json

# 搜索表
dbcli table search user --ds local-mysql --schema ms_base --json

# 查看 DDL
dbcli table ddl local-mysql.ms_base.base_user

# 查看索引
dbcli table index local-mysql.ms_base.base_user --json

# 查看外键
dbcli table fk local-mysql.ms_base.base_order --json

# 查看统计信息
dbcli table stats local-mysql.ms_base.base_user --json
```

### 4. Column 操作

```bash
# 搜索字段
dbcli column search id --ds local-mysql --schema ms_base --json

# 列出表的字段
dbcli column list local-mysql.ms_base.base_user --json

# 查看字段详情
dbcli column get local-mysql.ms_base.base_user.username --json
```

### 5. SQL 执行

```bash
# 执行查询
dbcli sql query --ds local-mysql --schema ms_base "SELECT * FROM base_user LIMIT 10" --json

# 校验 SQL（安全检查）
dbcli sql validate "DELETE FROM base_user" --json
# 输出: {"valid":false,"errorCode":"NO_WHERE_CLAUSE",...}

# 格式化 SQL
dbcli sql format "select * from user where id=1"

# 执行 explain
dbcli sql explain --ds local-mysql --schema ms_base "SELECT * FROM base_user"
```

### 6. 全局搜索

```bash
# 搜索数据库对象
dbcli search user --ds local-mysql --json

# 搜索字段
dbcli search id --type column --ds local-mysql --json
```

## 输出格式

支持多种输出格式：

```bash
--output table    # 默认表格格式
--output json     # JSON 格式（AI 推荐）
--output yaml     # YAML 格式
--output md       # Markdown 格式
--json            # 强制 JSON 输出
```

## 资源路径规范

采用三段式/四段式路径：

```
datasource.schema.table          # 三段式（表）
datasource.schema.table.column   # 四段式（字段）
```

示例：
```
local-mysql.ms_base.base_user
local-mysql.ms_base.base_user.username
```

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

```yaml
maxRows: 1000        # 最大返回行数
timeout: 30          # 查询超时（秒）
```

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
```

## 支持的数据库

| 数据库 | 状态 |
|--------|------|
| MySQL | ✅ 已支持 |
| PostgreSQL | ✅ 已支持 |
| Oracle | 🔜 V1.1 |
| SQLServer | 🔜 V1.1 |
| KingbaseES | 🔜 V1.1 |
| 达梦 DM8 | 🔜 V1.1 |

## 项目结构

```
dbcli/
 ├── dbcli-cli/           # CLI 入口（Picocli）
 ├── dbcli-core/          # 核心业务逻辑
 ├── dbcli-jdbc/          # JDBC 连接池（HikariCP）
 ├── dbcli-security/      # SQL 安全校验（JSqlParser）
 ├── dbcli-dialect-api/   # 数据库方言接口
 ├── dbcli-dialect-mysql/ # MySQL 实现
 ├── dbcli-dialect-pg/    # PostgreSQL 实现
 └── docs/
```

## 技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| Java | 17 | 运行时 |
| Picocli | 4.7.5 | CLI 框架 |
| HikariCP | 5.1.0 | 连接池 |
| Jackson | 2.17.1 | JSON/YAML |
| JSqlParser | 4.7 | SQL AST |
| GraalVM | 21.0.2 | Native Image |

## 后续规划

### V1.1
- Oracle/SQLServer 支持
- explain/analyze 增强
- KingbaseES/达梦支持

### V1.2
- MCP Server 模式
- HTTP API
- Web UI

### V2.0
- Data lineage
- Schema diff
- RBAC 权限控制
- 审计日志

## 许可证

MIT License
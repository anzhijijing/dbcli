# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# JAR build (fast development)
mvn package -DskipTests

# Native Image build (requires GraalVM 21+)
JAVA_HOME=~/.jdks/graalvm-community-openjdk-21.0.2+13.1 mvn -Pnative package -DskipTests

# Run tests
mvn test

# Run single test class
mvn test -Dtest=MetadataEngineTest

# Run CLI (Native Image - 8ms startup)
./dbcli-cli/target/dbcli-cli --help

# Run CLI (JAR - 224ms startup)
java -jar dbcli-cli/target/dbcli-cli-1.0.0-SNAPSHOT-jar-with-dependencies.jar --help
```

## Architecture

Multi-module Maven project with layered architecture:

```
dbcli-dialect-api/     # Interface: DatabaseDialect, metadata types
dbcli-dialect-*/       # Implementations: mysql, pg, kingbase, dm
dbcli-security/        # SQL validation (JSqlParser)
dbcli-jdbc/            # Connection pooling (HikariCP), config management
dbcli-core/            # Business logic: MetadataEngine, ExecutionEngine
dbcli-cli/             # Entry point: Picocli commands
```

**Key Dependencies Flow:**
- `dbcli-cli` → `dbcli-core` → `dbcli-security`, `dbcli-jdbc`, all dialects
- `dbcli-jdbc` → `dbcli-dialect-api` (for DatasourceConfig types)
- All dialects implement `dbcli-dialect-api`

**Two Core Engines:**
- `MetadataEngine`: Schema/table/column metadata operations, datasource management
- `ExecutionEngine`: SQL execution with security validation, query results

**Plugin Pattern for Databases:**
- `DatabaseProvider` interface: returns `DatabaseDialect` + `Driver` + URL builder
- Each dialect module: `XxxProvider.java` (factory) + `XxxDialect.java` (implementation)
- Dialects registered in `MetadataEngine.registerProviders()`

## Adding New Database Support

1. Create `dbcli-dialect-<name>/` module with:
   - `<Name>Dialect.java`: implements `DatabaseDialect` interface
   - `<Name>Provider.java`: implements `DatabaseProvider` interface
   - Add JDBC driver dependency in `pom.xml`

2. Register in parent `pom.xml` modules list

3. Register provider in `MetadataEngine.registerProviders()`:
   ```java
   providers.put("<name>", new <Name>Provider());
   ```

4. Add default URL/driver in `ConfigManager.setDefaultsForType()`

## SQL Security Rules

`SqlValidator` enforces:
- Forbidden: `DROP DATABASE`, `DROP SCHEMA`, `TRUNCATE`
- Requires WHERE clause: `UPDATE`, `DELETE`
- Row limit: SELECT queries capped at `maxRows` (default 1000)

## Resource Path Convention

Three/four-part path format:
- `datasource.schema.table` (e.g., `local-mysql.ms_base.base_user`)
- `datasource.schema.table.column`

## Configuration

Datasource config stored in `~/.dbcli/config.yaml`. Loaded on startup by `ConfigManager`, pools created via `ConnectionPoolManager`.

## Output Formats

CLI supports: `--output table|json|yaml|md` or `--json` shortcut. JSON output recommended for AI agent consumption - structured `ApiResponse` envelope with `success`, `data`, `error` fields.
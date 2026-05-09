package ai.dbcli.dialect;

import java.sql.Connection;
import java.util.List;

/**
 * Database dialect interface for different database types
 */
public interface DatabaseDialect {

    /**
     * Get database type identifier
     */
    String type();

    /**
     * List all schemas/databases
     */
    List<SchemaMeta> listSchemas(Connection conn) throws Exception;

    /**
     * List tables in a schema
     */
    List<TableMeta> listTables(Connection conn, String schema, String keyword) throws Exception;

    /**
     * Get detailed table metadata
     */
    TableMeta getTableMeta(Connection conn, String schema, String table) throws Exception;

    /**
     * Search columns by keyword across all tables
     */
    List<ColumnMeta> searchColumns(Connection conn, String schema, String keyword) throws Exception;

    /**
     * Get indexes for a table
     */
    List<IndexMeta> listIndexes(Connection conn, String schema, String table) throws Exception;

    /**
     * Get foreign keys for a table
     */
    List<ForeignKeyMeta> listForeignKeys(Connection conn, String schema, String table) throws Exception;

    /**
     * Get DDL for a table
     */
    String getTableDDL(Connection conn, String schema, String table) throws Exception;

    /**
     * Get table statistics (row count, etc.)
     */
    TableStats getTableStats(Connection conn, String schema, String table) throws Exception;
}
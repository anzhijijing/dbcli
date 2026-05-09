package ai.dbcli.core;

import ai.dbcli.dialect.*;
import ai.dbcli.dialect.mysql.MySqlProvider;
import ai.dbcli.dialect.pg.PgProvider;
import ai.dbcli.dialect.kingbase.KingbaseProvider;
import ai.dbcli.dialect.dm.DmProvider;
import ai.dbcli.jdbc.*;

import java.sql.Connection;
import java.util.*;

/**
 * Metadata engine for database metadata operations
 */
public class MetadataEngine {

    private final ConfigManager configManager;
    private final Map<String, DatabaseProvider> providers;

    public MetadataEngine() {
        this.configManager = new ConfigManager();
        this.providers = new HashMap<>();
        registerProviders();
    }

    private void registerProviders() {
        providers.put("mysql", new MySqlProvider());
        providers.put("postgresql", new PgProvider());
        providers.put("pg", new PgProvider());
        providers.put("kingbase", new KingbaseProvider());
        providers.put("dm", new DmProvider());
        providers.put("dameng", new DmProvider()); // alias for dm
    }

    /**
     * Get dialect for datasource
     */
    private DatabaseDialect getDialect(String datasource) {
        DatasourceConfig config = configManager.getDatasource(datasource);
        if (config == null) {
            throw new RuntimeException("Datasource '" + datasource + "' not found");
        }
        DatabaseProvider provider = providers.get(config.getType().toLowerCase());
        if (provider == null) {
            throw new RuntimeException("Unsupported database type: " + config.getType());
        }
        return provider.dialect();
    }

    /**
     * Get connection for datasource
     */
    private Connection getConnection(String datasource) {
        DatasourceConfig config = configManager.getDatasource(datasource);
        if (config == null) {
            throw new RuntimeException("Datasource '" + datasource + "' not found");
        }
        
        // Ensure pool is created
        if (!ConnectionPoolManager.hasPool(datasource)) {
            ConnectionPoolManager.getOrCreatePool(config);
        }
        
        try {
            return ConnectionPoolManager.getConnection(datasource);
        } catch (Exception e) {
            throw new RuntimeException("Failed to get connection: " + e.getMessage(), e);
        }
    }

    /**
     * Add datasource
     */
    public DatasourceConfig addDatasource(String name, String type, String host, Integer port, 
            String database, String username, String password) {
        DatasourceConfig config = new DatasourceConfig();
        config.setName(name);
        config.setType(type);
        config.setHost(host);
        config.setPort(port);
        config.setDatabase(database);
        config.setUsername(username);
        config.setPassword(password);
        
        // Build URL based on type
        DatabaseProvider provider = providers.get(type.toLowerCase());
        if (provider != null) {
            config.setUrl(provider.buildUrl(host, port, database));
            config.setDriverClassName(provider.driver().getClass().getName());
            if ("mysql".equals(type.toLowerCase())) {
                config.setValidationQuery("SELECT 1");
            } else {
                config.setValidationQuery("SELECT 1");
            }
        }
        
        configManager.addDatasource(config);
        
        // Create pool
        ConnectionPoolManager.getOrCreatePool(config);
        
        return config;
    }

    /**
     * Add datasource from config
     */
    public void addDatasource(DatasourceConfig config) {
        configManager.addDatasource(config);
        ConnectionPoolManager.getOrCreatePool(config);
    }

    /**
     * List all datasources
     */
    public List<DatasourceConfig> listDatasources() {
        return configManager.listDatasources();
    }

    /**
     * Get datasource config
     */
    public DatasourceConfig getDatasource(String name) {
        return configManager.getDatasource(name);
    }

    /**
     * Remove datasource
     */
    public void removeDatasource(String name) {
        configManager.removeDatasource(name);
    }

    /**
     * Test datasource connection
     */
    public boolean pingDatasource(String name) {
        return ConnectionPoolManager.ping(name);
    }

    /**
     * List schemas
     */
    public List<SchemaMeta> listSchemas(String datasource) {
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            List<SchemaMeta> schemas = dialect.listSchemas(conn);
            for (SchemaMeta schema : schemas) {
                schema.setDatasource(datasource);
            }
            return schemas;
        } catch (Exception e) {
            throw new RuntimeException("Failed to list schemas: " + e.getMessage(), e);
        }
    }

    /**
     * Get schema info
     */
    public SchemaMeta getSchema(String datasource, String schema) {
        SchemaMeta meta = new SchemaMeta();
        meta.setDatasource(datasource);
        meta.setName(schema);
        
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            List<TableMeta> tables = dialect.listTables(conn, schema, null);
            meta.setTableCount(tables.size());
        } catch (Exception e) {
            throw new RuntimeException("Failed to get schema: " + e.getMessage(), e);
        }
        
        return meta;
    }

    /**
     * List tables
     */
    public List<TableMeta> listTables(String datasource, String schema, String keyword) {
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            List<TableMeta> tables = dialect.listTables(conn, schema, keyword);
            for (TableMeta table : tables) {
                table.setDatasource(datasource);
            }
            return tables;
        } catch (Exception e) {
            throw new RuntimeException("Failed to list tables: " + e.getMessage(), e);
        }
    }

    /**
     * Get table metadata
     */
    public TableMeta getTable(String datasource, String schema, String table) {
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            TableMeta meta = dialect.getTableMeta(conn, schema, table);
            meta.setDatasource(datasource);
            return meta;
        } catch (Exception e) {
            throw new RuntimeException("Failed to get table: " + e.getMessage(), e);
        }
    }

    /**
     * Get table DDL
     */
    public String getTableDDL(String datasource, String schema, String table) {
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            return dialect.getTableDDL(conn, schema, table);
        } catch (Exception e) {
            throw new RuntimeException("Failed to get DDL: " + e.getMessage(), e);
        }
    }

    /**
     * Get table stats
     */
    public TableStats getTableStats(String datasource, String schema, String table) {
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            return dialect.getTableStats(conn, schema, table);
        } catch (Exception e) {
            throw new RuntimeException("Failed to get stats: " + e.getMessage(), e);
        }
    }

    /**
     * Search columns
     */
    public List<ColumnMeta> searchColumns(String datasource, String schema, String keyword) {
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            return dialect.searchColumns(conn, schema, keyword);
        } catch (Exception e) {
            throw new RuntimeException("Failed to search columns: " + e.getMessage(), e);
        }
    }

    /**
     * List indexes
     */
    public List<IndexMeta> listIndexes(String datasource, String schema, String table) {
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            return dialect.listIndexes(conn, schema, table);
        } catch (Exception e) {
            throw new RuntimeException("Failed to list indexes: " + e.getMessage(), e);
        }
    }

    /**
     * List foreign keys
     */
    public List<ForeignKeyMeta> listForeignKeys(String datasource, String schema, String table) {
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            return dialect.listForeignKeys(conn, schema, table);
        } catch (Exception e) {
            throw new RuntimeException("Failed to list foreign keys: " + e.getMessage(), e);
        }
    }

    /**
     * Global search across schemas and tables
     */
    public SearchResult search(String datasource, String keyword, SearchOptions options) {
        SearchResult result = new SearchResult();
        result.setKeyword(keyword);
        
        try (Connection conn = getConnection(datasource)) {
            DatabaseDialect dialect = getDialect(datasource);
            
            // Search schemas
            if (options.searchSchemas) {
                List<SchemaMeta> schemas = dialect.listSchemas(conn);
                for (SchemaMeta schema : schemas) {
                    if (schema.getName().toLowerCase().contains(keyword.toLowerCase())) {
                        result.addSchema(schema);
                    }
                }
            }
            
            // Search tables
            if (options.searchTables) {
                for (SchemaMeta schema : dialect.listSchemas(conn)) {
                    List<TableMeta> tables = dialect.listTables(conn, schema.getName(), keyword);
                    for (TableMeta table : tables) {
                        table.setDatasource(datasource);
                        result.addTable(table);
                    }
                }
            }
            
            // Search columns
            if (options.searchColumns) {
                for (SchemaMeta schema : dialect.listSchemas(conn)) {
                    try {
                        List<ColumnMeta> columns = dialect.searchColumns(conn, schema.getName(), keyword);
                        for (ColumnMeta col : columns) {
                            col.setComment(col.getComment()); // Keep comment
                            result.addColumn(col);
                        }
                    } catch (Exception e) {
                        // Skip if schema is not accessible
                    }
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to search: " + e.getMessage(), e);
        }
        
        return result;
    }

    /**
     * Get config manager
     */
    public ConfigManager getConfigManager() {
        return configManager;
    }
}
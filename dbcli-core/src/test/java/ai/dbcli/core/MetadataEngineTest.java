package ai.dbcli.core;

import ai.dbcli.jdbc.*;
import org.junit.jupiter.api.*;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Integration tests for MetadataEngine
 */
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
class MetadataEngineTest {

    private MetadataEngine engine;
    private static final String DS_NAME = "test-mysql";
    private static final String HOST = "192.168.1.40";
    private static final int PORT = 3306;
    private static final String DATABASE = "ms_base";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    @BeforeAll
    void setup() {
        engine = new MetadataEngine();
        
        // Add test datasource
        DatasourceConfig config = new DatasourceConfig();
        config.setName(DS_NAME);
        config.setType("mysql");
        config.setHost(HOST);
        config.setPort(PORT);
        config.setDatabase(DATABASE);
        config.setUsername(USERNAME);
        config.setPassword(PASSWORD);
        
        engine.addDatasource(config);
    }

    @AfterAll
    void cleanup() {
        engine.removeDatasource(DS_NAME);
    }

    @Test
    void testPingDatasource() {
        boolean connected = engine.pingDatasource(DS_NAME);
        assertTrue(connected, "Should be able to ping datasource");
    }

    @Test
    void testListDatasources() {
        List<DatasourceConfig> datasources = engine.listDatasources();
        assertFalse(datasources.isEmpty(), "Should have at least one datasource");
        
        boolean found = datasources.stream()
            .anyMatch(ds -> ds.getName().equals(DS_NAME));
        assertTrue(found, "Should find test datasource");
    }

    @Test
    void testListSchemas() {
        List<ai.dbcli.dialect.SchemaMeta> schemas = engine.listSchemas(DS_NAME);
        assertFalse(schemas.isEmpty(), "Should have at least one schema");
        
        // MySQL should have ms_base database
        boolean found = schemas.stream()
            .anyMatch(s -> s.getName().equals(DATABASE));
        assertTrue(found, "Should find ms_base schema");
    }

    @Test
    void testListTables() {
        List<ai.dbcli.dialect.TableMeta> tables = engine.listTables(DS_NAME, DATABASE, null);
        assertNotNull(tables, "Should return tables list");
        
        System.out.println("Found " + tables.size() + " tables in ms_base");
        for (ai.dbcli.dialect.TableMeta table : tables) {
            System.out.println("  - " + table.getTableName());
        }
    }

    @Test
    void testSearchColumns() {
        List<ai.dbcli.dialect.ColumnMeta> columns = engine.searchColumns(DS_NAME, DATABASE, "id");
        assertNotNull(columns, "Should return columns list");
        assertFalse(columns.isEmpty(), "Should find columns containing 'id'");
        
        System.out.println("Found " + columns.size() + " columns containing 'id'");
    }
}
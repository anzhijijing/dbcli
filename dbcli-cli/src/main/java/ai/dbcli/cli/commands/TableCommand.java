package ai.dbcli.cli.commands;

import ai.dbcli.cli.DbCli;
import ai.dbcli.core.*;
import ai.dbcli.dialect.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import java.util.concurrent.Callable;

/**
 * Table commands
 */
@Command(
    name = "table",
    description = "Table management commands",
    subcommands = {
        TableCommand.ListTables.class,
        TableCommand.Desc.class,
        TableCommand.Search.class,
        TableCommand.Ddl.class,
        TableCommand.Stats.class,
        TableCommand.Index.class,
        TableCommand.Fk.class
    }
)
public class TableCommand implements Runnable {

    @CommandLine.ParentCommand
    DbCli parent;

    @Override
    public void run() {
        System.out.println("Use 'table --help' to see subcommands");
    }

    @Command(name = "list", description = "List tables")
    static class ListTables implements Callable<Integer> {

        @CommandLine.ParentCommand
        TableCommand parent;

        @CommandLine.Option(names = {"--ds"}, required = true, description = "Datasource name")
        String datasource;

        @CommandLine.Option(names = {"--schema"}, description = "Schema name")
        String schema;

        @CommandLine.Option(names = {"--keyword"}, description = "Search keyword")
        String keyword;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                
                // If schema not provided, use first schema
                if (schema == null) {
                    java.util.List<SchemaMeta> schemas = engine.listSchemas(datasource);
                    if (!schemas.isEmpty()) {
                        schema = schemas.get(0).getName();
                    }
                }
                
                java.util.List<TableMeta> tables = engine.listTables(datasource, schema, keyword);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(tables)));
                } else {
                    System.out.println(formatter.formatList(tables, new String[]{"tableName", "tableType", "comment", "rowCount"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "desc", description = "Describe table structure")
    static class Desc implements Callable<Integer> {

        @CommandLine.ParentCommand
        TableCommand parent;

        @CommandLine.Parameters(index = "0", description = "Table path: datasource.schema.table")
        String path;

        @Override
        public Integer call() {
            try {
                String[] parts = parsePath(path, 3);
                String datasource = parts[0];
                String schema = parts[1];
                String table = parts[2];
                
                MetadataEngine engine = new MetadataEngine();
                TableMeta meta = engine.getTable(datasource, schema, table);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(meta)));
                } else {
                    System.out.println("Table: " + meta.getTableName());
                    System.out.println("Schema: " + meta.getSchema());
                    System.out.println("Type: " + meta.getTableType());
                    System.out.println("Comment: " + (meta.getComment() != null ? meta.getComment() : ""));
                    System.out.println();
                    System.out.println("Columns:");
                    System.out.println(formatter.formatList(meta.getColumns(), 
                        new String[]{"name", "type", "nullable", "primaryKey", "comment"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "search", description = "Search tables")
    static class Search implements Callable<Integer> {

        @CommandLine.ParentCommand
        TableCommand parent;

        @CommandLine.Option(names = {"--ds"}, required = true, description = "Datasource name")
        String datasource;

        @CommandLine.Option(names = {"--schema"}, description = "Schema name")
        String schema;

        @CommandLine.Parameters(index = "0", description = "Search keyword")
        String keyword;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                
                if (schema == null) {
                    java.util.List<SchemaMeta> schemas = engine.listSchemas(datasource);
                    if (!schemas.isEmpty()) {
                        schema = schemas.get(0).getName();
                    }
                }
                
                java.util.List<TableMeta> tables = engine.listTables(datasource, schema, keyword);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(tables)));
                } else {
                    System.out.println(formatter.formatList(tables, new String[]{"tableName", "tableType", "comment"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "ddl", description = "Get table DDL")
    static class Ddl implements Callable<Integer> {

        @CommandLine.ParentCommand
        TableCommand parent;

        @CommandLine.Parameters(index = "0", description = "Table path: datasource.schema.table")
        String path;

        @Override
        public Integer call() {
            try {
                String[] parts = parsePath(path, 3);
                String datasource = parts[0];
                String schema = parts[1];
                String table = parts[2];
                
                MetadataEngine engine = new MetadataEngine();
                String ddl = engine.getTableDDL(datasource, schema, table);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    ApiResponse response = new ApiResponse();
                    response.setSuccess(true);
                    response.setData(ddl);
                    System.out.println(mapper.writeValueAsString(response));
                } else {
                    System.out.println(ddl);
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "stats", description = "Get table statistics")
    static class Stats implements Callable<Integer> {

        @CommandLine.ParentCommand
        TableCommand parent;

        @CommandLine.Parameters(index = "0", description = "Table path: datasource.schema.table")
        String path;

        @Override
        public Integer call() {
            try {
                String[] parts = parsePath(path, 3);
                String datasource = parts[0];
                String schema = parts[1];
                String table = parts[2];
                
                MetadataEngine engine = new MetadataEngine();
                TableStats stats = engine.getTableStats(datasource, schema, table);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(stats)));
                } else {
                    System.out.println("Row count: " + stats.getRowCount());
                    System.out.println("Data size: " + formatSize(stats.getDataSize()));
                    System.out.println("Index size: " + formatSize(stats.getIndexSize()));
                    System.out.println("Last updated: " + stats.getLastUpdated());
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }

        private String formatSize(Long bytes) {
            if (bytes == null) return "N/A";
            if (bytes < 1024) return bytes + " B";
            if (bytes < 1024 * 1024) return (bytes / 1024) + " KB";
            if (bytes < 1024 * 1024 * 1024) return (bytes / (1024 * 1024)) + " MB";
            return (bytes / (1024 * 1024 * 1024)) + " GB";
        }
    }

    @Command(name = "index", description = "List indexes")
    static class Index implements Callable<Integer> {

        @CommandLine.ParentCommand
        TableCommand parent;

        @CommandLine.Parameters(index = "0", description = "Table path: datasource.schema.table")
        String path;

        @Override
        public Integer call() {
            try {
                String[] parts = parsePath(path, 3);
                String datasource = parts[0];
                String schema = parts[1];
                String table = parts[2];
                
                MetadataEngine engine = new MetadataEngine();
                java.util.List<IndexMeta> indexes = engine.listIndexes(datasource, schema, table);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(indexes)));
                } else {
                    System.out.println(formatter.formatList(indexes, new String[]{"name", "type", "unique", "primary", "columns"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "fk", description = "List foreign keys")
    static class Fk implements Callable<Integer> {

        @CommandLine.ParentCommand
        TableCommand parent;

        @CommandLine.Parameters(index = "0", description = "Table path: datasource.schema.table")
        String path;

        @Override
        public Integer call() {
            try {
                String[] parts = parsePath(path, 3);
                String datasource = parts[0];
                String schema = parts[1];
                String table = parts[2];
                
                MetadataEngine engine = new MetadataEngine();
                java.util.List<ForeignKeyMeta> fks = engine.listForeignKeys(datasource, schema, table);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(fks)));
                } else {
                    System.out.println(formatter.formatList(fks, 
                        new String[]{"name", "columnName", "refTable", "refColumn", "onDelete"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    private static String[] parsePath(String path, int expectedParts) {
        String[] parts = path.split("\\.");
        if (parts.length < expectedParts) {
            throw new RuntimeException("Invalid path format. Expected: datasource.schema[.table[.column]]");
        }
        return parts;
    }
}
package ai.dbcli.cli.commands;

import ai.dbcli.cli.DbCli;
import ai.dbcli.core.*;
import ai.dbcli.dialect.*;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import java.util.concurrent.Callable;

/**
 * Column commands
 */
@Command(
    name = "column",
    description = "Column management commands",
    subcommands = {
        ColumnCommand.Search.class,
        ColumnCommand.ListColumns.class,
        ColumnCommand.Get.class
    }
)
public class ColumnCommand implements Runnable {

    @CommandLine.ParentCommand
    DbCli parent;

    @Override
    public void run() {
        System.out.println("Use 'column --help' to see subcommands");
    }

    @Command(name = "search", description = "Search columns by keyword")
    static class Search implements Callable<Integer> {

        @CommandLine.ParentCommand
        ColumnCommand parent;

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
                
                java.util.List<ColumnMeta> columns = engine.searchColumns(datasource, schema, keyword);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    System.out.println(formatter.formatJson(formatter.success(columns)));
                } else {
                    System.out.println(formatter.formatList(columns, 
                        new String[]{"name", "type", "nullable", "primaryKey", "comment"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "list", description = "List columns of a table")
    static class ListColumns implements Callable<Integer> {

        @CommandLine.ParentCommand
        ColumnCommand parent;

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
                java.util.List<ColumnMeta> columns = meta.getColumns();
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    System.out.println(formatter.formatJson(formatter.success(columns)));
                } else {
                    System.out.println(formatter.formatList(columns, 
                        new String[]{"name", "type", "nullable", "primaryKey", "comment"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "get", description = "Get column details")
    static class Get implements Callable<Integer> {

        @CommandLine.ParentCommand
        ColumnCommand parent;

        @CommandLine.Parameters(index = "0", description = "Column path: datasource.schema.table.column")
        String path;

        @Override
        public Integer call() {
            try {
                String[] parts = parsePath(path, 4);
                String datasource = parts[0];
                String schema = parts[1];
                String table = parts[2];
                String column = parts[3];
                
                MetadataEngine engine = new MetadataEngine();
                TableMeta meta = engine.getTable(datasource, schema, table);
                
                ColumnMeta colMeta = null;
                for (ColumnMeta col : meta.getColumns()) {
                    if (col.getName().equals(column)) {
                        colMeta = col;
                        break;
                    }
                }
                
                if (colMeta == null) {
                    System.err.println("Column '" + column + "' not found");
                    return 1;
                }
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    System.out.println(formatter.formatJson(formatter.success(colMeta)));
                } else {
                    System.out.println("Name: " + colMeta.getName());
                    System.out.println("Type: " + colMeta.getType());
                    System.out.println("Nullable: " + colMeta.isNullable());
                    System.out.println("Primary key: " + colMeta.isPrimaryKey());
                    System.out.println("Default: " + colMeta.getDefaultValue());
                    System.out.println("Comment: " + colMeta.getComment());
                    System.out.println("Position: " + colMeta.getPosition());
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
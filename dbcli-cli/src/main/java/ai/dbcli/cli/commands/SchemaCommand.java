package ai.dbcli.cli.commands;

import ai.dbcli.cli.DbCli;
import ai.dbcli.core.*;
import ai.dbcli.dialect.SchemaMeta;
import ai.dbcli.jdbc.DatasourceConfig;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import java.util.concurrent.Callable;

/**
 * Schema commands
 */
@Command(
    name = "schema",
    description = "Schema management commands",
    subcommands = {
        SchemaCommand.ListSchemas.class,
        SchemaCommand.Get.class,
        SchemaCommand.Search.class
    }
)
public class SchemaCommand implements Runnable {

    @CommandLine.ParentCommand
    DbCli parent;

    @Override
    public void run() {
        System.out.println("Use 'schema --help' to see subcommands");
    }

    @Command(name = "list", description = "List schemas")
    static class ListSchemas implements Callable<Integer> {

        @CommandLine.ParentCommand
        SchemaCommand parent;

        @CommandLine.Option(names = {"--ds"}, required = true, description = "Datasource name")
        String datasource;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                java.util.List<SchemaMeta> schemas = engine.listSchemas(datasource);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    System.out.println(formatter.formatJson(formatter.success(schemas)));
                } else {
                    System.out.println(formatter.formatList(schemas, new String[]{"name", "tableCount"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "get", description = "Get schema details")
    static class Get implements Callable<Integer> {

        @CommandLine.ParentCommand
        SchemaCommand parent;

        @CommandLine.Parameters(index = "0", description = "Schema path: datasource.schema")
        String path;

        @Override
        public Integer call() {
            try {
                String[] parts = parsePath(path, 2);
                String datasource = parts[0];
                String schemaName = parts[1];

                MetadataEngine engine = new MetadataEngine();

                // Check datasource exists
                DatasourceConfig dsConfig = engine.getDatasource(datasource);
                if (dsConfig == null) {
                    OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                    if (parent.parent.getOutputFormat().equals("json")) {
                        System.out.println(formatter.formatJson(formatter.error("DATASOURCE_NOT_FOUND", "Datasource '" + datasource + "' not found")));
                    } else {
                        System.err.println("Datasource '" + datasource + "' not found");
                    }
                    return 1;
                }

                // Check schema exists
                java.util.List<SchemaMeta> schemas = engine.listSchemas(datasource);
                boolean schemaExists = schemas.stream()
                    .anyMatch(s -> s.getName().equalsIgnoreCase(schemaName));

                if (!schemaExists) {
                    OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                    if (parent.parent.getOutputFormat().equals("json")) {
                        System.out.println(formatter.formatJson(formatter.error("SCHEMA_NOT_FOUND", "Schema '" + schemaName + "' not found in datasource '" + datasource + "'")));
                    } else {
                        System.err.println("Schema '" + schemaName + "' not found");
                    }
                    return 1;
                }

                SchemaMeta meta = engine.getSchema(datasource, schemaName);

                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());

                if (parent.parent.getOutputFormat().equals("json")) {
                    System.out.println(formatter.formatJson(formatter.success(meta)));
                } else {
                    System.out.println("Schema: " + meta.getName());
                    System.out.println("Datasource: " + meta.getDatasource());
                    System.out.println("Tables: " + meta.getTableCount());
                }

                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "search", description = "Search schemas")
    static class Search implements Callable<Integer> {

        @CommandLine.ParentCommand
        SchemaCommand parent;

        @CommandLine.Option(names = {"--ds"}, required = true, description = "Datasource name")
        String datasource;

        @CommandLine.Parameters(index = "0", description = "Search keyword")
        String keyword;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                java.util.List<SchemaMeta> schemas = engine.listSchemas(datasource);
                
                // Filter by keyword
                java.util.List<SchemaMeta> filtered = schemas.stream()
                    .filter(s -> s.getName().toLowerCase().contains(keyword.toLowerCase()))
                    .toList();
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    System.out.println(formatter.formatJson(formatter.success(filtered)));
                } else {
                    System.out.println(formatter.formatList(filtered, new String[]{"name", "tableCount"}));
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
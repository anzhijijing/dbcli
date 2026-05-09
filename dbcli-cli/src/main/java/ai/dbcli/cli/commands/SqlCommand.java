package ai.dbcli.cli.commands;

import ai.dbcli.cli.DbCli;
import ai.dbcli.core.*;
import ai.dbcli.dialect.SqlValidateResult;
import com.fasterxml.jackson.databind.ObjectMapper;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import java.util.concurrent.Callable;

/**
 * SQL commands
 */
@Command(
    name = "sql",
    description = "SQL execution commands",
    subcommands = {
        SqlCommand.Query.class,
        SqlCommand.Validate.class,
        SqlCommand.Format.class,
        SqlCommand.Explain.class
    }
)
public class SqlCommand implements Runnable {

    @CommandLine.ParentCommand
    DbCli parent;

    @Override
    public void run() {
        System.out.println("Use 'sql --help' to see subcommands");
    }

    @Command(name = "query", description = "Execute SQL query")
    static class Query implements Callable<Integer> {

        @CommandLine.ParentCommand
        SqlCommand parent;

        @CommandLine.Option(names = {"--ds"}, required = true, description = "Datasource name")
        String datasource;

        @CommandLine.Option(names = {"--schema"}, description = "Schema name")
        String schema;

        @CommandLine.Parameters(index = "0", description = "SQL statement")
        String sql;

        @CommandLine.Option(names = {"--maxRows"}, description = "Maximum rows to return", defaultValue = "1000")
        int maxRows;

        @Override
        public Integer call() {
            try {
                ExecutionEngine engine = new ExecutionEngine();
                
                // Ensure datasource exists
                if (!engine.getMetadataEngine().getConfigManager().hasDatasource(datasource)) {
                    System.err.println("Datasource '" + datasource + "' not found. Add it first with: dbcli datasource add");
                    return 1;
                }
                
                QueryResult result = engine.executeQuery(datasource, schema, sql, maxRows);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(result)));
                } else {
                    if (result.getColumns() != null && !result.getColumns().isEmpty()) {
                        System.out.println(formatter.formatTable(result));
                    } else {
                        System.out.println("Rows affected: " + result.getRowCount());
                    }
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                
                // Output error as JSON if json mode
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    OutputFormatter formatter = new OutputFormatter();
                    try {
                        System.out.println(mapper.writeValueAsString(formatter.error("EXECUTION_ERROR", e.getMessage())));
                    } catch (Exception ignored) {}
                }
                
                return 1;
            }
        }
    }

    @Command(name = "validate", description = "Validate SQL statement")
    static class Validate implements Callable<Integer> {

        @CommandLine.ParentCommand
        SqlCommand parent;

        @CommandLine.Parameters(index = "0", description = "SQL statement")
        String sql;

        @Override
        public Integer call() {
            try {
                ExecutionEngine engine = new ExecutionEngine();
                SqlValidateResult result = engine.validate(sql);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(result)));
                } else {
                    System.out.println("Valid: " + result.isValid());
                    System.out.println("SQL type: " + result.getSqlType());
                    if (!result.isValid()) {
                        System.out.println("Error code: " + result.getErrorCode());
                        System.out.println("Message: " + result.getMessage());
                    }
                    if (!result.getWarnings().isEmpty()) {
                        System.out.println("Warnings:");
                        for (String warning : result.getWarnings()) {
                            System.out.println("  - " + warning);
                        }
                    }
                }
                
                return result.isValid() ? 0 : 1;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "format", description = "Format SQL statement")
    static class Format implements Callable<Integer> {

        @CommandLine.ParentCommand
        SqlCommand parent;

        @CommandLine.Parameters(index = "0", description = "SQL statement")
        String sql;

        @Override
        public Integer call() {
            try {
                ExecutionEngine engine = new ExecutionEngine();
                String formatted = engine.formatSql(sql);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    ApiResponse response = new ApiResponse();
                    response.setSuccess(true);
                    response.setData(formatted);
                    System.out.println(mapper.writeValueAsString(response));
                } else {
                    System.out.println(formatted);
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "explain", description = "Explain SQL execution plan")
    static class Explain implements Callable<Integer> {

        @CommandLine.ParentCommand
        SqlCommand parent;

        @CommandLine.Option(names = {"--ds"}, required = true, description = "Datasource name")
        String datasource;

        @CommandLine.Option(names = {"--schema"}, description = "Schema name")
        String schema;

        @CommandLine.Parameters(index = "0", description = "SQL statement")
        String sql;

        @Override
        public Integer call() {
            try {
                ExecutionEngine engine = new ExecutionEngine();
                QueryResult result = engine.explain(datasource, schema, sql);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(result)));
                } else {
                    System.out.println(formatter.formatTable(result));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }
}
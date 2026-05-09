package ai.dbcli.cli;

import ai.dbcli.cli.commands.*;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.ScopeType;

/**
 * DBCLI main entry point
 */
@Command(
    name = "dbcli",
    description = "AI-Friendly Database CLI Runtime",
    subcommands = {
        DatasourceCommand.class,
        SchemaCommand.class,
        TableCommand.class,
        ColumnCommand.class,
        SqlCommand.class,
        SearchCommand.class
    },
    mixinStandardHelpOptions = true,
    version = "1.0.0"
)
public class DbCli implements Runnable {

    @CommandLine.Option(names = {"--output"}, 
            description = "Output format: table, json, yaml, md",
            scope = ScopeType.INHERIT)
    private String outputFormat;

    @CommandLine.Option(names = {"--json"}, 
            description = "Force JSON output",
            scope = ScopeType.INHERIT)
    private boolean forceJson;

    @CommandLine.Option(names = {"--non-interactive"}, 
            description = "Non-interactive mode",
            scope = ScopeType.INHERIT)
    private boolean nonInteractive;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new DbCli()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public void run() {
        System.out.println("DBCLI - AI-Friendly Database CLI Runtime");
        System.out.println("Use --help to see available commands");
    }

    public String getOutputFormat() {
        if (forceJson) {
            return "json";
        }
        return outputFormat != null ? outputFormat : "table";
    }

    public boolean isNonInteractive() {
        return nonInteractive;
    }
}
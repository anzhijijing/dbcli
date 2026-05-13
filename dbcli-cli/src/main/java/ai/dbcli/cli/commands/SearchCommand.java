package ai.dbcli.cli.commands;

import ai.dbcli.cli.DbCli;
import ai.dbcli.core.*;
import ai.dbcli.dialect.*;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import java.util.concurrent.Callable;

/**
 * Global search command
 */
@Command(
    name = "search",
    description = "Global search across database objects"
)
public class SearchCommand implements Callable<Integer> {

    @CommandLine.ParentCommand
    DbCli parent;

    @CommandLine.Option(names = {"--ds"}, required = true, description = "Datasource name")
    String datasource;

    @CommandLine.Parameters(index = "0", description = "Search keyword")
    String keyword;

    @CommandLine.Option(names = {"--type"}, description = "Search type: all, schema, table, column")
    String searchType = "all";

    @CommandLine.Option(names = {"--comment"}, description = "Include comments in search")
    boolean searchComments;

    @Override
    public Integer call() {
        try {
            MetadataEngine engine = new MetadataEngine();
            
            SearchOptions options = new SearchOptions();
            if ("schema".equals(searchType)) {
                options = SearchOptions.schemasOnly();
            } else if ("table".equals(searchType)) {
                options = SearchOptions.tablesOnly();
            } else if ("column".equals(searchType)) {
                options = SearchOptions.columnsOnly();
            }
            options.searchComments = searchComments;
            
            SearchResult result = engine.search(datasource, keyword, options);
            
            OutputFormatter formatter = new OutputFormatter(parent.getOutputFormat());
            
            if (parent.getOutputFormat().equals("json")) {
                System.out.println(formatter.formatJson(formatter.success(result)));
            } else {
                System.out.println("Search results for: " + keyword);
                System.out.println();
                
                if (!result.getSchemas().isEmpty()) {
                    System.out.println("Schemas:");
                    System.out.println(formatter.formatList(result.getSchemas(), new String[]{"name"}));
                    System.out.println();
                }
                
                if (!result.getTables().isEmpty()) {
                    System.out.println("Tables:");
                    System.out.println(formatter.formatList(result.getTables(), 
                        new String[]{"schema", "tableName", "comment"}));
                    System.out.println();
                }
                
                if (!result.getColumns().isEmpty()) {
                    System.out.println("Columns:");
                    System.out.println(formatter.formatList(result.getColumns(), 
                        new String[]{"name", "type", "comment"}));
                }
                
                if (result.getSchemas().isEmpty() && result.getTables().isEmpty() && 
                    result.getColumns().isEmpty()) {
                    System.out.println("No results found");
                }
            }
            
            return 0;
        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            return 1;
        }
    }
}
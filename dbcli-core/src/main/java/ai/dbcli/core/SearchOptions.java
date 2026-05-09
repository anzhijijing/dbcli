package ai.dbcli.core;

/**
 * Search options
 */
public class SearchOptions {

    public boolean searchSchemas = true;
    public boolean searchTables = true;
    public boolean searchColumns = true;
    public boolean searchComments = false;
    public int limit = 100;

    public SearchOptions() {}

    public static SearchOptions all() {
        return new SearchOptions();
    }

    public static SearchOptions schemasOnly() {
        SearchOptions opts = new SearchOptions();
        opts.searchTables = false;
        opts.searchColumns = false;
        return opts;
    }

    public static SearchOptions tablesOnly() {
        SearchOptions opts = new SearchOptions();
        opts.searchSchemas = false;
        opts.searchColumns = false;
        return opts;
    }

    public static SearchOptions columnsOnly() {
        SearchOptions opts = new SearchOptions();
        opts.searchSchemas = false;
        opts.searchTables = false;
        return opts;
    }
}
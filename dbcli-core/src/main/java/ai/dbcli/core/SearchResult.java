package ai.dbcli.core;

import java.util.ArrayList;
import java.util.List;

import ai.dbcli.dialect.*;

/**
 * Search result container
 */
public class SearchResult {

    private String keyword;
    private List<SchemaMeta> schemas = new ArrayList<>();
    private List<TableMeta> tables = new ArrayList<>();
    private List<ColumnMeta> columns = new ArrayList<>();

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public List<SchemaMeta> getSchemas() {
        return schemas;
    }

    public void setSchemas(List<SchemaMeta> schemas) {
        this.schemas = schemas;
    }

    public void addSchema(SchemaMeta schema) {
        this.schemas.add(schema);
    }

    public List<TableMeta> getTables() {
        return tables;
    }

    public void setTables(List<TableMeta> tables) {
        this.tables = tables;
    }

    public void addTable(TableMeta table) {
        this.tables.add(table);
    }

    public List<ColumnMeta> getColumns() {
        return columns;
    }

    public void setColumns(List<ColumnMeta> columns) {
        this.columns = columns;
    }

    public void addColumn(ColumnMeta column) {
        this.columns.add(column);
    }
}
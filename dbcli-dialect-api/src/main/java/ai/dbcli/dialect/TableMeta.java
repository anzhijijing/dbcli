package ai.dbcli.dialect;

import java.util.List;

/**
 * Table metadata information
 */
public class TableMeta {

    private String datasource;
    private String schema;
    private String tableName;
    private String tableType;
    private String comment;
    private List<ColumnMeta> columns;
    private List<IndexMeta> indexes;
    private List<ForeignKeyMeta> foreignKeys;
    private Long rowCount;

    public TableMeta() {}

    public String getDatasource() {
        return datasource;
    }

    public void setDatasource(String datasource) {
        this.datasource = datasource;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getTableType() {
        return tableType;
    }

    public void setTableType(String tableType) {
        this.tableType = tableType;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public List<ColumnMeta> getColumns() {
        return columns;
    }

    public void setColumns(List<ColumnMeta> columns) {
        this.columns = columns;
    }

    public List<IndexMeta> getIndexes() {
        return indexes;
    }

    public void setIndexes(List<IndexMeta> indexes) {
        this.indexes = indexes;
    }

    public List<ForeignKeyMeta> getForeignKeys() {
        return foreignKeys;
    }

    public void setForeignKeys(List<ForeignKeyMeta> foreignKeys) {
        this.foreignKeys = foreignKeys;
    }

    public Long getRowCount() {
        return rowCount;
    }

    public void setRowCount(Long rowCount) {
        this.rowCount = rowCount;
    }

    /**
     * Get full path: datasource.schema.tableName
     */
    public String getFullPath() {
        return datasource + "." + schema + "." + tableName;
    }
}
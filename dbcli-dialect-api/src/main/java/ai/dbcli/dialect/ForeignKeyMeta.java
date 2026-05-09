package ai.dbcli.dialect;

/**
 * Foreign key metadata information
 */
public class ForeignKeyMeta {

    private String name;
    private String columnName;
    private String refSchema;
    private String refTable;
    private String refColumn;
    private String onUpdate;
    private String onDelete;

    public ForeignKeyMeta() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getRefSchema() {
        return refSchema;
    }

    public void setRefSchema(String refSchema) {
        this.refSchema = refSchema;
    }

    public String getRefTable() {
        return refTable;
    }

    public void setRefTable(String refTable) {
        this.refTable = refTable;
    }

    public String getRefColumn() {
        return refColumn;
    }

    public void setRefColumn(String refColumn) {
        this.refColumn = refColumn;
    }

    public String getOnUpdate() {
        return onUpdate;
    }

    public void setOnUpdate(String onUpdate) {
        this.onUpdate = onUpdate;
    }

    public String getOnDelete() {
        return onDelete;
    }

    public void setOnDelete(String onDelete) {
        this.onDelete = onDelete;
    }
}
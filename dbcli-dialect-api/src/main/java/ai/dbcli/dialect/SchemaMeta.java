package ai.dbcli.dialect;

/**
 * Schema metadata information
 */
public class SchemaMeta {

    private String datasource;
    private String name;
    private String comment;
    private Integer tableCount;

    public SchemaMeta() {}

    public String getDatasource() {
        return datasource;
    }

    public void setDatasource(String datasource) {
        this.datasource = datasource;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getTableCount() {
        return tableCount;
    }

    public void setTableCount(Integer tableCount) {
        this.tableCount = tableCount;
    }

    public String getFullPath() {
        return datasource + "." + name;
    }
}
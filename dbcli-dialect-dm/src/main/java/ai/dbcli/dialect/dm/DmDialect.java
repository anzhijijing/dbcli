package ai.dbcli.dialect.dm;

import ai.dbcli.dialect.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * DaMeng (DM) database dialect implementation
 * DaMeng has its own system tables and metadata query methods
 */
public class DmDialect implements DatabaseDialect {

    @Override
    public String type() {
        return "dm";
    }

    @Override
    public List<SchemaMeta> listSchemas(Connection conn) throws Exception {
        List<SchemaMeta> schemas = new ArrayList<>();
        // DaMeng uses schemas similar to Oracle/PostgreSQL
        // Query all schemas/users from system tables
        String sql = "SELECT USERNAME FROM ALL_USERS " +
                "WHERE USERNAME NOT IN ('SYS', 'SYSDBA', 'SYSSSO', 'SYS Auditor', 'CTISYS') " +
                "ORDER BY USERNAME";
        
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                SchemaMeta meta = new SchemaMeta();
                meta.setName(rs.getString(1));
                
                // Get table count
                String countSql = "SELECT COUNT(*) FROM ALL_TABLES WHERE OWNER = ?";
                try (PreparedStatement ps = conn.prepareStatement(countSql)) {
                    ps.setString(1, meta.getName().toUpperCase());
                    try (ResultSet crs = ps.executeQuery()) {
                        if (crs.next()) {
                            meta.setTableCount(crs.getInt(1));
                        }
                    }
                }
                
                schemas.add(meta);
            }
        } catch (Exception e) {
            // Fallback: try using information_schema
            try {
                String fallbackSql = "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA " +
                        "WHERE SCHEMA_NAME NOT IN ('SYS', 'SYSDBA', 'INFORMATION_SCHEMA') " +
                        "ORDER BY SCHEMA_NAME";
                try (Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(fallbackSql)) {
                    while (rs.next()) {
                        SchemaMeta meta = new SchemaMeta();
                        meta.setName(rs.getString(1));
                        schemas.add(meta);
                    }
                }
            } catch (Exception ex) {
                // Last fallback: use current schema
                SchemaMeta meta = new SchemaMeta();
                meta.setName(getCurrentSchema(conn));
                schemas.add(meta);
            }
        }
        return schemas;
    }

    private String getCurrentSchema(Connection conn) throws SQLException {
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT USER")) {
            if (rs.next()) {
                return rs.getString(1);
            }
        }
        return "PUBLIC";
    }

    @Override
    public List<TableMeta> listTables(Connection conn, String schema, String keyword) throws Exception {
        List<TableMeta> tables = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT TABLE_NAME, 'TABLE' as TABLE_TYPE " +
                "FROM ALL_TABLES WHERE OWNER = ?");
        
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND TABLE_NAME LIKE ?");
        }
        sql.append(" ORDER BY TABLE_NAME");
        
        try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            int idx = 1;
            ps.setString(idx++, schema.toUpperCase());
            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(idx++, "%" + keyword.toUpperCase() + "%");
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TableMeta meta = new TableMeta();
                    meta.setSchema(schema);
                    meta.setTableName(rs.getString("TABLE_NAME"));
                    meta.setTableType(rs.getString("TABLE_TYPE"));
                    
                    // Get comment from ALL_TAB_COMMENTS
                    try {
                        String commentSql = "SELECT COMMENTS FROM ALL_TAB_COMMENTS " +
                                "WHERE OWNER = ? AND TABLE_NAME = ?";
                        try (PreparedStatement cps = conn.prepareStatement(commentSql)) {
                            cps.setString(1, schema.toUpperCase());
                            cps.setString(2, meta.getTableName().toUpperCase());
                            try (ResultSet crs = cps.executeQuery()) {
                                if (crs.next()) {
                                    meta.setComment(crs.getString(1));
                                }
                            }
                        }
                    } catch (Exception e) {
                        // Comment query might fail, ignore
                    }
                    
                    tables.add(meta);
                }
            }
        }
        
        // Also add views
        try {
            StringBuilder viewSql = new StringBuilder(
                    "SELECT VIEW_NAME, 'VIEW' as TABLE_TYPE " +
                    "FROM ALL_VIEWS WHERE OWNER = ?");
            if (keyword != null && !keyword.isEmpty()) {
                viewSql.append(" AND VIEW_NAME LIKE ?");
            }
            viewSql.append(" ORDER BY VIEW_NAME");
            
            try (PreparedStatement ps = conn.prepareStatement(viewSql.toString())) {
                int idx = 1;
                ps.setString(idx++, schema.toUpperCase());
                if (keyword != null && !keyword.isEmpty()) {
                    ps.setString(idx++, "%" + keyword.toUpperCase() + "%");
                }
                
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        TableMeta meta = new TableMeta();
                        meta.setSchema(schema);
                        meta.setTableName(rs.getString("VIEW_NAME"));
                        meta.setTableType("VIEW");
                        tables.add(meta);
                    }
                }
            }
        } catch (Exception e) {
            // Views query might fail, ignore
        }
        
        return tables;
    }

    @Override
    public TableMeta getTableMeta(Connection conn, String schema, String table) throws Exception {
        TableMeta meta = new TableMeta();
        meta.setSchema(schema);
        meta.setTableName(table);
        meta.setTableType("TABLE");
        
        // Get comment
        try {
            String commentSql = "SELECT COMMENTS FROM ALL_TAB_COMMENTS " +
                    "WHERE OWNER = ? AND TABLE_NAME = ?";
            try (PreparedStatement ps = conn.prepareStatement(commentSql)) {
                ps.setString(1, schema.toUpperCase());
                ps.setString(2, table.toUpperCase());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        meta.setComment(rs.getString(1));
                    }
                }
            }
        } catch (Exception e) {
            // Ignore
        }
        
        // Get columns
        meta.setColumns(listColumns(conn, schema, table));
        
        // Get indexes
        meta.setIndexes(listIndexes(conn, schema, table));
        
        // Get foreign keys
        meta.setForeignKeys(listForeignKeys(conn, schema, table));
        
        return meta;
    }

    private List<ColumnMeta> listColumns(Connection conn, String schema, String table) throws Exception {
        List<ColumnMeta> columns = new ArrayList<>();
        // DaMeng uses ALL_TAB_COLUMNS for column metadata
        String sql = "SELECT COLUMN_NAME, DATA_TYPE, DATA_LENGTH, DATA_PRECISION, DATA_SCALE, " +
                "NULLABLE, DATA_DEFAULT, COLUMN_ID " +
                "FROM ALL_TAB_COLUMNS WHERE OWNER = ? AND TABLE_NAME = ? " +
                "ORDER BY COLUMN_ID";
        
        // Get primary key columns
        List<String> pkColumns = getPrimaryKeyColumns(conn, schema, table);
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema.toUpperCase());
            ps.setString(2, table.toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ColumnMeta col = new ColumnMeta();
                    col.setName(rs.getString("COLUMN_NAME"));
                    
                    // Build type string
                    String dataType = rs.getString("DATA_TYPE");
                    Integer dataLen = rs.getObject("DATA_LENGTH") != null ? 
                            rs.getInt("DATA_LENGTH") : null;
                    Integer dataPrec = rs.getObject("DATA_PRECISION") != null ? 
                            rs.getInt("DATA_PRECISION") : null;
                    Integer dataScale = rs.getObject("DATA_SCALE") != null ? 
                            rs.getInt("DATA_SCALE") : null;
                    
                    String type = dataType;
                    if (dataLen != null && dataLen > 0 && 
                            (dataType.contains("CHAR") || dataType.contains("VARCHAR"))) {
                        type = dataType + "(" + dataLen + ")";
                    } else if (dataPrec != null && dataScale != null && dataScale > 0) {
                        type = dataType + "(" + dataPrec + "," + dataScale + ")";
                    } else if (dataPrec != null && dataPrec > 0) {
                        type = dataType + "(" + dataPrec + ")";
                    }
                    col.setType(type);
                    
                    col.setNullable("Y".equalsIgnoreCase(rs.getString("NULLABLE")));
                    col.setPrimaryKey(pkColumns.contains(col.getName().toUpperCase()));
                    col.setDefaultValue(rs.getString("DATA_DEFAULT"));
                    col.setPosition(rs.getInt("COLUMN_ID"));
                    col.setLength(dataLen);
                    col.setPrecision(dataPrec);
                    col.setScale(dataScale);
                    
                    // Get column comment
                    try {
                        String colCommentSql = "SELECT COMMENTS FROM ALL_COL_COMMENTS " +
                                "WHERE OWNER = ? AND TABLE_NAME = ? AND COLUMN_NAME = ?";
                        try (PreparedStatement cps = conn.prepareStatement(colCommentSql)) {
                            cps.setString(1, schema.toUpperCase());
                            cps.setString(2, table.toUpperCase());
                            cps.setString(3, col.getName().toUpperCase());
                            try (ResultSet crs = cps.executeQuery()) {
                                if (crs.next()) {
                                    col.setComment(crs.getString(1));
                                }
                            }
                        }
                    } catch (Exception e) {
                        // Ignore
                    }
                    
                    columns.add(col);
                }
            }
        }
        return columns;
    }

    private List<String> getPrimaryKeyColumns(Connection conn, String schema, String table) throws Exception {
        List<String> pkColumns = new ArrayList<>();
        // DaMeng uses ALL_CONSTRAINTS and ALL_CONS_COLUMNS for constraints
        String sql = "SELECT cc.COLUMN_NAME " +
                "FROM ALL_CONSTRAINTS c " +
                "JOIN ALL_CONS_COLUMNS cc ON c.OWNER = cc.OWNER " +
                "AND c.CONSTRAINT_NAME = cc.CONSTRAINT_NAME " +
                "WHERE c.OWNER = ? AND c.TABLE_NAME = ? " +
                "AND c.CONSTRAINT_TYPE = 'P' " +
                "ORDER BY cc.POSITION";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema.toUpperCase());
            ps.setString(2, table.toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    pkColumns.add(rs.getString(1));
                }
            }
        } catch (Exception e) {
            // Fallback: try information_schema
            try {
                String fallbackSql = "SELECT kcu.COLUMN_NAME " +
                        "FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc " +
                        "JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu " +
                        "ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME " +
                        "WHERE tc.CONSTRAINT_TYPE = 'PRIMARY KEY' " +
                        "AND tc.TABLE_SCHEMA = ? AND tc.TABLE_NAME = ?";
                try (PreparedStatement ps = conn.prepareStatement(fallbackSql)) {
                    ps.setString(1, schema);
                    ps.setString(2, table);
                    try (ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            pkColumns.add(rs.getString(1));
                        }
                    }
                }
            } catch (Exception ex) {
                // Ignore
            }
        }
        return pkColumns;
    }

    @Override
    public List<ColumnMeta> searchColumns(Connection conn, String schema, String keyword) throws Exception {
        List<ColumnMeta> columns = new ArrayList<>();
        String sql = "SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, NULLABLE " +
                "FROM ALL_TAB_COLUMNS WHERE OWNER = ? AND COLUMN_NAME LIKE ? " +
                "ORDER BY TABLE_NAME, COLUMN_ID";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema.toUpperCase());
            ps.setString(2, "%" + keyword.toUpperCase() + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ColumnMeta col = new ColumnMeta();
                    col.setName(rs.getString("COLUMN_NAME"));
                    col.setType(rs.getString("DATA_TYPE"));
                    col.setNullable("Y".equalsIgnoreCase(rs.getString("NULLABLE")));
                    columns.add(col);
                }
            }
        }
        return columns;
    }

    @Override
    public List<IndexMeta> listIndexes(Connection conn, String schema, String table) throws Exception {
        List<IndexMeta> indexes = new ArrayList<>();
        // DaMeng uses ALL_INDEXES and ALL_IND_COLUMNS for index metadata
        String sql = "SELECT i.INDEX_NAME, ic.COLUMN_NAME, i.INDEX_TYPE, i.UNIQUENESS " +
                "FROM ALL_INDEXES i " +
                "JOIN ALL_IND_COLUMNS ic ON i.OWNER = ic.INDEX_OWNER " +
                "AND i.INDEX_NAME = ic.INDEX_NAME " +
                "WHERE i.TABLE_OWNER = ? AND i.TABLE_NAME = ? " +
                "ORDER BY i.INDEX_NAME, ic.COLUMN_POSITION";
        
        Map<String, IndexMeta> indexMap = new LinkedHashMap<>();
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema.toUpperCase());
            ps.setString(2, table.toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String indexName = rs.getString("INDEX_NAME");
                    String columnName = rs.getString("COLUMN_NAME");
                    String indexType = rs.getString("INDEX_TYPE");
                    boolean isUnique = "UNIQUE".equalsIgnoreCase(rs.getString("UNIQUENESS"));
                    
                    IndexMeta idx = indexMap.get(indexName);
                    if (idx == null) {
                        idx = new IndexMeta();
                        idx.setName(indexName);
                        idx.setType(indexType != null ? indexType : "BTREE");
                        idx.setUnique(isUnique);
                        idx.setPrimary(indexName.toLowerCase().contains("primary") || 
                                indexName.toUpperCase().startsWith("PK_"));
                        idx.setColumns(new ArrayList<>());
                        indexMap.put(indexName, idx);
                    }
                    
                    idx.getColumns().add(columnName);
                }
            }
        } catch (Exception e) {
            // Fallback: try information_schema
            try {
                String fallbackSql = "SELECT INDEX_NAME, COLUMN_NAME, NON_UNIQUE " +
                        "FROM INFORMATION_SCHEMA.STATISTICS " +
                        "WHERE TABLE_SCHEMA = ? AND TABLE_NAME = ? " +
                        "ORDER BY INDEX_NAME, SEQ_IN_INDEX";
                try (PreparedStatement ps = conn.prepareStatement(fallbackSql)) {
                    ps.setString(1, schema);
                    ps.setString(2, table);
                    try (ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            String indexName = rs.getString("INDEX_NAME");
                            String columnName = rs.getString("COLUMN_NAME");
                            boolean isUnique = !rs.getBoolean("NON_UNIQUE");
                            
                            IndexMeta idx = indexMap.get(indexName);
                            if (idx == null) {
                                idx = new IndexMeta();
                                idx.setName(indexName);
                                idx.setType("BTREE");
                                idx.setUnique(isUnique);
                                idx.setPrimary(false);
                                idx.setColumns(new ArrayList<>());
                                indexMap.put(indexName, idx);
                            }
                            idx.getColumns().add(columnName);
                        }
                    }
                }
            } catch (Exception ex) {
                // Ignore
            }
        }
        
        indexes.addAll(indexMap.values());
        return indexes;
    }

    @Override
    public List<ForeignKeyMeta> listForeignKeys(Connection conn, String schema, String table) throws Exception {
        List<ForeignKeyMeta> fks = new ArrayList<>();
        // DaMeng uses ALL_CONSTRAINTS for foreign keys
        String sql = "SELECT c.CONSTRAINT_NAME, cc.COLUMN_NAME, " +
                "r.OWNER as REF_SCHEMA, r.TABLE_NAME as REF_TABLE, " +
                "rc.COLUMN_NAME as REF_COLUMN, c.STATUS " +
                "FROM ALL_CONSTRAINTS c " +
                "JOIN ALL_CONS_COLUMNS cc ON c.OWNER = cc.OWNER " +
                "AND c.CONSTRAINT_NAME = cc.CONSTRAINT_NAME " +
                "JOIN ALL_CONSTRAINTS r ON c.R_OWNER = r.OWNER " +
                "AND c.R_CONSTRAINT_NAME = r.CONSTRAINT_NAME " +
                "JOIN ALL_CONS_COLUMNS rc ON r.OWNER = rc.OWNER " +
                "AND r.CONSTRAINT_NAME = rc.CONSTRAINT_NAME " +
                "WHERE c.OWNER = ? AND c.TABLE_NAME = ? " +
                "AND c.CONSTRAINT_TYPE = 'R'";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema.toUpperCase());
            ps.setString(2, table.toUpperCase());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ForeignKeyMeta fk = new ForeignKeyMeta();
                    fk.setName(rs.getString("CONSTRAINT_NAME"));
                    fk.setColumnName(rs.getString("COLUMN_NAME"));
                    fk.setRefSchema(rs.getString("REF_SCHEMA"));
                    fk.setRefTable(rs.getString("REF_TABLE"));
                    fk.setRefColumn(rs.getString("REF_COLUMN"));
                    fk.setOnUpdate("NO ACTION");
                    fk.setOnDelete("NO ACTION");
                    fks.add(fk);
                }
            }
        } catch (Exception e) {
            // Fallback: try information_schema
            try {
                String fallbackSql = "SELECT tc.CONSTRAINT_NAME, kcu.COLUMN_NAME, " +
                        "ccu.TABLE_SCHEMA as REF_SCHEMA, ccu.TABLE_NAME as REF_TABLE, " +
                        "ccu.COLUMN_NAME as REF_COLUMN, rc.UPDATE_RULE, rc.DELETE_RULE " +
                        "FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc " +
                        "JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE kcu " +
                        "ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME " +
                        "JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ccu " +
                        "ON ccu.CONSTRAINT_NAME = tc.CONSTRAINT_NAME " +
                        "JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS rc " +
                        "ON rc.CONSTRAINT_NAME = tc.CONSTRAINT_NAME " +
                        "WHERE tc.CONSTRAINT_TYPE = 'FOREIGN KEY' " +
                        "AND tc.TABLE_SCHEMA = ? AND tc.TABLE_NAME = ?";
                try (PreparedStatement ps = conn.prepareStatement(fallbackSql)) {
                    ps.setString(1, schema);
                    ps.setString(2, table);
                    try (ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            ForeignKeyMeta fk = new ForeignKeyMeta();
                            fk.setName(rs.getString("CONSTRAINT_NAME"));
                            fk.setColumnName(rs.getString("COLUMN_NAME"));
                            fk.setRefSchema(rs.getString("REF_SCHEMA"));
                            fk.setRefTable(rs.getString("REF_TABLE"));
                            fk.setRefColumn(rs.getString("REF_COLUMN"));
                            fk.setOnUpdate(rs.getString("UPDATE_RULE"));
                            fk.setOnDelete(rs.getString("DELETE_RULE"));
                            fks.add(fk);
                        }
                    }
                }
            } catch (Exception ex) {
                // Ignore
            }
        }
        return fks;
    }

    @Override
    public String getTableDDL(Connection conn, String schema, String table) throws Exception {
        // DaMeng has SP_DDL_TABLE function to get DDL
        try {
            String sql = "SELECT DBMS_METADATA.GET_DDL('TABLE', ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, table.toUpperCase());
                ps.setString(2, schema.toUpperCase());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        return rs.getString(1);
                    }
                }
            }
        } catch (Exception e) {
            // Fallback: reconstruct DDL from metadata
        }
        
        // Reconstruct DDL from metadata
        TableMeta meta = getTableMeta(conn, schema, table);
        StringBuilder ddl = new StringBuilder();
        
        ddl.append("CREATE TABLE ").append(schema).append(".").append(table).append(" (\n");
        
        List<String> columnDefs = new ArrayList<>();
        List<String> pkColumns = new ArrayList<>();
        
        for (ColumnMeta col : meta.getColumns()) {
            StringBuilder colDef = new StringBuilder();
            colDef.append("  ").append(col.getName()).append(" ").append(col.getType());
            if (!col.isNullable()) {
                colDef.append(" NOT NULL");
            }
            if (col.getDefaultValue() != null) {
                colDef.append(" DEFAULT ").append(col.getDefaultValue());
            }
            if (col.isPrimaryKey()) {
                pkColumns.add(col.getName());
            }
            columnDefs.add(colDef.toString());
        }
        
        ddl.append(String.join(",\n", columnDefs));
        
        if (!pkColumns.isEmpty()) {
            ddl.append(",\n  PRIMARY KEY (").append(String.join(", ", pkColumns)).append(")");
        }
        
        ddl.append("\n)");
        
        return ddl.toString();
    }

    @Override
    public TableStats getTableStats(Connection conn, String schema, String table) throws Exception {
        TableStats stats = new TableStats();
        
        // DaMeng uses system tables for statistics
        try {
            // Get row count - try using NUM_ROWS from ALL_TABLES
            String sql = "SELECT NUM_ROWS FROM ALL_TABLES WHERE OWNER = ? AND TABLE_NAME = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, schema.toUpperCase());
                ps.setString(2, table.toUpperCase());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        stats.setRowCount(rs.getLong("NUM_ROWS"));
                    }
                }
            }
            
            // If NUM_ROWS is not available or is 0, try COUNT(*)
            if (stats.getRowCount() <= 0) {
                String countSql = "SELECT COUNT(*) FROM " + schema + "." + table;
                try (Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(countSql)) {
                    if (rs.next()) {
                        stats.setRowCount(rs.getLong(1));
                    }
                }
            }
        } catch (Exception e) {
            stats.setRowCount(-1L);
        }
        
        // Data size and index size - DaMeng doesn't have simple functions for this
        stats.setDataSize(-1L);
        stats.setIndexSize(-1L);
        
        return stats;
    }
}
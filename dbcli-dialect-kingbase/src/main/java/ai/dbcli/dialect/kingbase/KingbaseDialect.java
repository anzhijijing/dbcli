package ai.dbcli.dialect.kingbase;

import ai.dbcli.dialect.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * KingbaseES database dialect implementation
 * Kingbase is based on PostgreSQL, so most SQL queries are similar
 */
public class KingbaseDialect implements DatabaseDialect {

    @Override
    public String type() {
        return "kingbase";
    }

    @Override
    public List<SchemaMeta> listSchemas(Connection conn) throws Exception {
        List<SchemaMeta> schemas = new ArrayList<>();
        // Kingbase uses similar schema system as PostgreSQL
        String sql = "SELECT schema_name FROM information_schema.schemata " +
                "WHERE schema_name NOT IN ('pg_catalog', 'information_schema', 'pg_toast', 'sys', 'SYS', 'pg_internal') " +
                "ORDER BY schema_name";
        
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                SchemaMeta meta = new SchemaMeta();
                meta.setName(rs.getString(1));
                
                // Get table count
                String countSql = "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = ?";
                try (PreparedStatement ps = conn.prepareStatement(countSql)) {
                    ps.setString(1, meta.getName());
                    try (ResultSet crs = ps.executeQuery()) {
                        if (crs.next()) {
                            meta.setTableCount(crs.getInt(1));
                        }
                    }
                }
                
                schemas.add(meta);
            }
        }
        return schemas;
    }

    @Override
    public List<TableMeta> listTables(Connection conn, String schema, String keyword) throws Exception {
        List<TableMeta> tables = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT table_name, table_type " +
                "FROM information_schema.tables WHERE table_schema = ?");
        
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND table_name LIKE ?");
        }
        sql.append(" ORDER BY table_name");
        
        try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            int idx = 1;
            ps.setString(idx++, schema);
            if (keyword != null && !keyword.isEmpty()) {
                ps.setString(idx++, "%" + keyword + "%");
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TableMeta meta = new TableMeta();
                    meta.setSchema(schema);
                    meta.setTableName(rs.getString("table_name"));
                    meta.setTableType(rs.getString("table_type"));
                    
                    // Get comment - Kingbase uses similar comment system as PostgreSQL
                    String commentSql = "SELECT obj_description(c.oid, 'pg_class') " +
                            "FROM pg_class c " +
                            "JOIN pg_namespace n ON n.oid = c.relnamespace " +
                            "WHERE n.nspname = ? AND c.relname = ?";
                    try (PreparedStatement cps = conn.prepareStatement(commentSql)) {
                        cps.setString(1, schema);
                        cps.setString(2, meta.getTableName());
                        try (ResultSet crs = cps.executeQuery()) {
                            if (crs.next()) {
                                meta.setComment(crs.getString(1));
                            }
                        }
                    } catch (Exception e) {
                        // Comment query might fail, ignore
                    }
                    
                    tables.add(meta);
                }
            }
        }
        return tables;
    }

    @Override
    public TableMeta getTableMeta(Connection conn, String schema, String table) throws Exception {
        TableMeta meta = new TableMeta();
        meta.setSchema(schema);
        meta.setTableName(table);
        
        // Get table type
        String tableSql = "SELECT table_type FROM information_schema.tables " +
                "WHERE table_schema = ? AND table_name = ?";
        try (PreparedStatement ps = conn.prepareStatement(tableSql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    meta.setTableType(rs.getString("table_type"));
                }
            }
        }
        
        // Get comment
        try {
            String commentSql = "SELECT obj_description(c.oid, 'pg_class') " +
                    "FROM pg_class c " +
                    "JOIN pg_namespace n ON n.oid = c.relnamespace " +
                    "WHERE n.nspname = ? AND c.relname = ?";
            try (PreparedStatement ps = conn.prepareStatement(commentSql)) {
                ps.setString(1, schema);
                ps.setString(2, table);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        meta.setComment(rs.getString(1));
                    }
                }
            }
        } catch (Exception e) {
            // Ignore comment query failure
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
        String sql = "SELECT column_name, data_type, udt_name, character_maximum_length, " +
                "numeric_precision, numeric_scale, is_nullable, column_default, ordinal_position " +
                "FROM information_schema.columns " +
                "WHERE table_schema = ? AND table_name = ? ORDER BY ordinal_position";
        
        // Get primary key columns
        List<String> pkColumns = getPrimaryKeyColumns(conn, schema, table);
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ColumnMeta col = new ColumnMeta();
                    col.setName(rs.getString("column_name"));
                    
                    // Build type string
                    String dataType = rs.getString("data_type");
                    Integer charLen = rs.getObject("character_maximum_length") != null ? 
                            rs.getInt("character_maximum_length") : null;
                    Integer numPrec = rs.getObject("numeric_precision") != null ? 
                            rs.getInt("numeric_precision") : null;
                    Integer numScale = rs.getObject("numeric_scale") != null ? 
                            rs.getInt("numeric_scale") : null;
                    
                    String type = dataType;
                    if (charLen != null && charLen > 0) {
                        type = dataType + "(" + charLen + ")";
                    } else if (numPrec != null && numScale != null) {
                        type = dataType + "(" + numPrec + "," + numScale + ")";
                    } else if (numPrec != null) {
                        type = dataType + "(" + numPrec + ")";
                    }
                    col.setType(type);
                    
                    col.setNullable("YES".equalsIgnoreCase(rs.getString("is_nullable")));
                    col.setPrimaryKey(pkColumns.contains(col.getName()));
                    col.setDefaultValue(rs.getString("column_default"));
                    col.setPosition(rs.getInt("ordinal_position"));
                    col.setLength(charLen);
                    col.setPrecision(numPrec);
                    col.setScale(numScale);
                    
                    // Get column comment
                    try {
                        String colCommentSql = "SELECT col_description(a.attrelid, a.attnum) " +
                                "FROM pg_attribute a " +
                                "JOIN pg_class c ON c.oid = a.attrelid " +
                                "JOIN pg_namespace n ON n.oid = c.relnamespace " +
                                "WHERE n.nspname = ? AND c.relname = ? AND a.attname = ?";
                        try (PreparedStatement cps = conn.prepareStatement(colCommentSql)) {
                            cps.setString(1, schema);
                            cps.setString(2, table);
                            cps.setString(3, col.getName());
                            try (ResultSet crs = cps.executeQuery()) {
                                if (crs.next()) {
                                    col.setComment(crs.getString(1));
                                }
                            }
                        }
                    } catch (Exception e) {
                        // Ignore comment query failure
                    }
                    
                    columns.add(col);
                }
            }
        }
        return columns;
    }

    private List<String> getPrimaryKeyColumns(Connection conn, String schema, String table) throws Exception {
        List<String> pkColumns = new ArrayList<>();
        String sql = "SELECT a.attname " +
                "FROM pg_index i " +
                "JOIN pg_class c ON c.oid = i.indrelid " +
                "JOIN pg_namespace n ON n.oid = c.relnamespace " +
                "JOIN pg_attribute a ON a.attrelid = c.oid AND a.attnum = ANY(i.indkey) " +
                "WHERE n.nspname = ? AND c.relname = ? AND i.indisprimary";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    pkColumns.add(rs.getString(1));
                }
            }
        } catch (Exception e) {
            // Fallback: try using constraint-based query
            try {
                String fallbackSql = "SELECT kcu.column_name " +
                        "FROM information_schema.table_constraints tc " +
                        "JOIN information_schema.key_column_usage kcu " +
                        "ON tc.constraint_name = kcu.constraint_name " +
                        "WHERE tc.constraint_type = 'PRIMARY KEY' " +
                        "AND tc.table_schema = ? AND tc.table_name = ?";
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
                // Ignore if both fail
            }
        }
        return pkColumns;
    }

    @Override
    public List<ColumnMeta> searchColumns(Connection conn, String schema, String keyword) throws Exception {
        List<ColumnMeta> columns = new ArrayList<>();
        String sql = "SELECT table_name, column_name, data_type, is_nullable " +
                "FROM information_schema.columns " +
                "WHERE table_schema = ? AND column_name LIKE ? " +
                "ORDER BY table_name, ordinal_position";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, "%" + keyword + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ColumnMeta col = new ColumnMeta();
                    col.setName(rs.getString("column_name"));
                    col.setType(rs.getString("data_type"));
                    col.setNullable("YES".equalsIgnoreCase(rs.getString("is_nullable")));
                    columns.add(col);
                }
            }
        }
        return columns;
    }

    @Override
    public List<IndexMeta> listIndexes(Connection conn, String schema, String table) throws Exception {
        List<IndexMeta> indexes = new ArrayList<>();
        String sql = "SELECT i.relname as index_name, am.amname as index_type, " +
                "a.attname as column_name, idx.indisunique, idx.indisprimary " +
                "FROM pg_index idx " +
                "JOIN pg_class i ON i.oid = idx.indexrelid " +
                "JOIN pg_class t ON t.oid = idx.indrelid " +
                "JOIN pg_namespace n ON n.oid = t.relnamespace " +
                "JOIN pg_am am ON am.oid = i.relam " +
                "JOIN pg_attribute a ON a.attrelid = t.oid AND a.attnum = ANY(idx.indkey) " +
                "WHERE n.nspname = ? AND t.relname = ? " +
                "ORDER BY i.relname, a.attnum";
        
        Map<String, IndexMeta> indexMap = new LinkedHashMap<>();
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String indexName = rs.getString("index_name");
                    String columnName = rs.getString("column_name");
                    String indexType = rs.getString("index_type");
                    boolean isUnique = rs.getBoolean("indisunique");
                    boolean isPrimary = rs.getBoolean("indisprimary");
                    
                    IndexMeta idx = indexMap.get(indexName);
                    if (idx == null) {
                        idx = new IndexMeta();
                        idx.setName(indexName);
                        idx.setType(indexType);
                        idx.setUnique(isUnique);
                        idx.setPrimary(isPrimary);
                        idx.setColumns(new ArrayList<>());
                        indexMap.put(indexName, idx);
                    }
                    
                    idx.getColumns().add(columnName);
                }
            }
        } catch (Exception e) {
            // Fallback: use information_schema based query
            try {
                String fallbackSql = "SELECT index_name, column_name, non_unique " +
                        "FROM information_schema.statistics " +
                        "WHERE table_schema = ? AND table_name = ? " +
                        "ORDER BY index_name, seq_in_index";
                try (PreparedStatement ps = conn.prepareStatement(fallbackSql)) {
                    ps.setString(1, schema);
                    ps.setString(2, table);
                    try (ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            String indexName = rs.getString("index_name");
                            String columnName = rs.getString("column_name");
                            boolean isUnique = !rs.getBoolean("non_unique");
                            
                            IndexMeta idx = indexMap.get(indexName);
                            if (idx == null) {
                                idx = new IndexMeta();
                                idx.setName(indexName);
                                idx.setType("BTREE");
                                idx.setUnique(isUnique);
                                idx.setPrimary(indexName.toLowerCase().contains("primary"));
                                idx.setColumns(new ArrayList<>());
                                indexMap.put(indexName, idx);
                            }
                            idx.getColumns().add(columnName);
                        }
                    }
                }
            } catch (Exception ex) {
                // Ignore if both fail
            }
        }
        
        indexes.addAll(indexMap.values());
        return indexes;
    }

    @Override
    public List<ForeignKeyMeta> listForeignKeys(Connection conn, String schema, String table) throws Exception {
        List<ForeignKeyMeta> fks = new ArrayList<>();
        String sql = "SELECT tc.constraint_name, kcu.column_name, " +
                "ccu.table_schema as ref_schema, ccu.table_name as ref_table, " +
                "ccu.column_name as ref_column, rc.update_rule, rc.delete_rule " +
                "FROM information_schema.table_constraints tc " +
                "JOIN information_schema.key_column_usage kcu " +
                "ON tc.constraint_name = kcu.constraint_name " +
                "AND tc.table_schema = kcu.table_schema " +
                "JOIN information_schema.constraint_column_usage ccu " +
                "ON ccu.constraint_name = tc.constraint_name " +
                "JOIN information_schema.referential_constraints rc " +
                "ON rc.constraint_name = tc.constraint_name " +
                "WHERE tc.constraint_type = 'FOREIGN KEY' " +
                "AND tc.table_schema = ? AND tc.table_name = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ForeignKeyMeta fk = new ForeignKeyMeta();
                    fk.setName(rs.getString("constraint_name"));
                    fk.setColumnName(rs.getString("column_name"));
                    fk.setRefSchema(rs.getString("ref_schema"));
                    fk.setRefTable(rs.getString("ref_table"));
                    fk.setRefColumn(rs.getString("ref_column"));
                    fk.setOnUpdate(rs.getString("update_rule"));
                    fk.setOnDelete(rs.getString("delete_rule"));
                    fks.add(fk);
                }
            }
        }
        return fks;
    }

    @Override
    public String getTableDDL(Connection conn, String schema, String table) throws Exception {
        // Kingbase doesn't have a simple SHOW CREATE TABLE command
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
        
        // Get row count estimate - Kingbase uses similar stats system as PostgreSQL
        String sql = "SELECT reltuples::bigint, pg_relation_size(c.oid) as data_size, " +
                "pg_indexes_size(c.oid) as index_size " +
                "FROM pg_class c " +
                "JOIN pg_namespace n ON n.oid = c.relnamespace " +
                "WHERE n.nspname = ? AND c.relname = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    stats.setRowCount(rs.getLong("reltuples"));
                    stats.setDataSize(rs.getLong("data_size"));
                    stats.setIndexSize(rs.getLong("index_size"));
                }
            }
        } catch (Exception e) {
            // Fallback: use COUNT(*) for row count
            try {
                String countSql = "SELECT COUNT(*) FROM " + schema + "." + table;
                try (Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(countSql)) {
                    if (rs.next()) {
                        stats.setRowCount(rs.getLong(1));
                    }
                }
            } catch (Exception ex) {
                stats.setRowCount(-1L);
            }
            stats.setDataSize(-1L);
            stats.setIndexSize(-1L);
        }
        
        return stats;
    }
}
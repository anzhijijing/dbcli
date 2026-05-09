package ai.dbcli.dialect.mysql;

import ai.dbcli.dialect.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * MySQL database dialect implementation
 */
public class MySqlDialect implements DatabaseDialect {

    @Override
    public String type() {
        return "mysql";
    }

    @Override
    public List<SchemaMeta> listSchemas(Connection conn) throws Exception {
        List<SchemaMeta> schemas = new ArrayList<>();
        String sql = "SHOW DATABASES";
        
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                SchemaMeta meta = new SchemaMeta();
                meta.setName(rs.getString(1));
                meta.setComment("");
                
                // Get table count for each schema
                try {
                    String countSql = "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = ?";
                    try (PreparedStatement ps = conn.prepareStatement(countSql)) {
                        ps.setString(1, meta.getName());
                        try (ResultSet crs = ps.executeQuery()) {
                            if (crs.next()) {
                                meta.setTableCount(crs.getInt(1));
                            }
                        }
                    }
                } catch (SQLException e) {
                    // Skip table count if permission denied
                    meta.setTableCount(0);
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
                "SELECT table_name, table_type, table_comment, table_rows " +
                "FROM information_schema.tables WHERE table_schema = ?");
        
        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (table_name LIKE ? OR table_comment LIKE ?)");
        }
        sql.append(" ORDER BY table_name");
        
        try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            int idx = 1;
            ps.setString(idx++, schema);
            if (keyword != null && !keyword.isEmpty()) {
                String likePattern = "%" + keyword + "%";
                ps.setString(idx++, likePattern);
                ps.setString(idx++, likePattern);
            }
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TableMeta meta = new TableMeta();
                    meta.setSchema(schema);
                    meta.setTableName(rs.getString("table_name"));
                    meta.setTableType(rs.getString("table_type"));
                    meta.setComment(rs.getString("table_comment"));
                    meta.setRowCount(rs.getLong("table_rows"));
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
        
        // Get table info
        String tableSql = "SELECT table_type, table_comment, table_rows " +
                "FROM information_schema.tables WHERE table_schema = ? AND table_name = ?";
        try (PreparedStatement ps = conn.prepareStatement(tableSql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    meta.setTableType(rs.getString("table_type"));
                    meta.setComment(rs.getString("table_comment"));
                    meta.setRowCount(rs.getLong("table_rows"));
                }
            }
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
        String sql = "SELECT column_name, column_type, column_comment, is_nullable, column_key, " +
                "column_default, ordinal_position, character_maximum_length, " +
                "numeric_precision, numeric_scale, extra " +
                "FROM information_schema.columns " +
                "WHERE table_schema = ? AND table_name = ? ORDER BY ordinal_position";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ColumnMeta col = new ColumnMeta();
                    col.setName(rs.getString("column_name"));
                    col.setType(rs.getString("column_type"));
                    col.setComment(rs.getString("column_comment"));
                    col.setNullable("YES".equalsIgnoreCase(rs.getString("is_nullable")));
                    
                    String columnKey = rs.getString("column_key");
                    col.setPrimaryKey("PRI".equals(columnKey));
                    col.setUnique("UNI".equals(columnKey));
                    
                    col.setDefaultValue(rs.getString("column_default"));
                    col.setPosition(rs.getInt("ordinal_position"));
                    col.setLength(rs.getObject("character_maximum_length") != null ? 
                            rs.getInt("character_maximum_length") : null);
                    col.setPrecision(rs.getObject("numeric_precision") != null ? 
                            rs.getInt("numeric_precision") : null);
                    col.setScale(rs.getObject("numeric_scale") != null ? 
                            rs.getInt("numeric_scale") : null);
                    col.setAutoIncrement(rs.getString("extra").contains("auto_increment"));
                    
                    columns.add(col);
                }
            }
        }
        return columns;
    }

    @Override
    public List<ColumnMeta> searchColumns(Connection conn, String schema, String keyword) throws Exception {
        List<ColumnMeta> columns = new ArrayList<>();
        String sql = "SELECT table_name, column_name, column_type, column_comment, is_nullable, column_key " +
                "FROM information_schema.columns " +
                "WHERE table_schema = ? AND (column_name LIKE ? OR column_comment LIKE ?) " +
                "ORDER BY table_name, ordinal_position";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            String likePattern = "%" + keyword + "%";
            ps.setString(2, likePattern);
            ps.setString(3, likePattern);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ColumnMeta col = new ColumnMeta();
                    col.setName(rs.getString("column_name"));
                    col.setType(rs.getString("column_type"));
                    col.setComment(rs.getString("column_comment"));
                    col.setNullable("YES".equalsIgnoreCase(rs.getString("is_nullable")));
                    
                    String columnKey = rs.getString("column_key");
                    col.setPrimaryKey("PRI".equals(columnKey));
                    col.setUnique("UNI".equals(columnKey));
                    
                    columns.add(col);
                }
            }
        }
        return columns;
    }

    @Override
    public List<IndexMeta> listIndexes(Connection conn, String schema, String table) throws Exception {
        List<IndexMeta> indexes = new ArrayList<>();
        String sql = "SELECT index_name, non_unique, index_type, column_name " +
                "FROM information_schema.statistics " +
                "WHERE table_schema = ? AND table_name = ? " +
                "ORDER BY index_name, seq_in_index";
        
        Map<String, IndexMeta> indexMap = new LinkedHashMap<>();
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String indexName = rs.getString("index_name");
                    String columnName = rs.getString("column_name");
                    boolean nonUnique = rs.getBoolean("non_unique");
                    String indexType = rs.getString("index_type");
                    
                    IndexMeta idx = indexMap.get(indexName);
                    if (idx == null) {
                        idx = new IndexMeta();
                        idx.setName(indexName);
                        idx.setUnique(!nonUnique);
                        idx.setPrimary("PRIMARY".equals(indexName));
                        idx.setType(indexType);
                        idx.setColumns(new ArrayList<>());
                        indexMap.put(indexName, idx);
                    }
                    
                    idx.getColumns().add(columnName);
                }
            }
        }
        
        indexes.addAll(indexMap.values());
        return indexes;
    }

    @Override
    public List<ForeignKeyMeta> listForeignKeys(Connection conn, String schema, String table) throws Exception {
        List<ForeignKeyMeta> fks = new ArrayList<>();
        String sql = "SELECT kcu.constraint_name, kcu.column_name, kcu.referenced_table_schema, " +
                "kcu.referenced_table_name, kcu.referenced_column_name, rc.update_rule, rc.delete_rule " +
                "FROM information_schema.key_column_usage kcu " +
                "JOIN information_schema.referential_constraints rc " +
                "ON kcu.constraint_name = rc.constraint_name " +
                "AND kcu.table_schema = rc.constraint_schema " +
                "AND kcu.table_name = rc.table_name " +
                "WHERE kcu.table_schema = ? AND kcu.table_name = ? " +
                "AND kcu.referenced_table_name IS NOT NULL";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ForeignKeyMeta fk = new ForeignKeyMeta();
                    fk.setName(rs.getString("constraint_name"));
                    fk.setColumnName(rs.getString("column_name"));
                    fk.setRefSchema(rs.getString("referenced_table_schema"));
                    fk.setRefTable(rs.getString("referenced_table_name"));
                    fk.setRefColumn(rs.getString("referenced_column_name"));
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
        String sql = "SHOW CREATE TABLE `" + schema + "`.`" + table + "`";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                return rs.getString(2);
            }
        }
        return null;
    }

    @Override
    public TableStats getTableStats(Connection conn, String schema, String table) throws Exception {
        TableStats stats = new TableStats();
        
        // Get row count and data size
        String sql = "SELECT table_rows, data_length, index_length, update_time " +
                "FROM information_schema.tables " +
                "WHERE table_schema = ? AND table_name = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, schema);
            ps.setString(2, table);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    stats.setRowCount(rs.getLong("table_rows"));
                    stats.setDataSize(rs.getLong("data_length"));
                    stats.setIndexSize(rs.getLong("index_length"));
                    stats.setLastUpdated(rs.getString("update_time"));
                }
            }
        }
        
        return stats;
    }
}
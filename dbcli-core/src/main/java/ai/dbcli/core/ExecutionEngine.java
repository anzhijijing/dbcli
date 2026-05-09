package ai.dbcli.core;

import ai.dbcli.dialect.SqlValidateResult;
import ai.dbcli.jdbc.*;
import ai.dbcli.security.SqlValidator;

import java.sql.*;
import java.util.*;

/**
 * SQL execution engine with security validation
 */
public class ExecutionEngine {

    private final MetadataEngine metadataEngine;
    private final SqlValidator sqlValidator;
    private int defaultMaxRows = 1000;
    private int defaultTimeout = 30;

    public ExecutionEngine() {
        this.metadataEngine = new MetadataEngine();
        this.sqlValidator = new SqlValidator(defaultMaxRows, defaultTimeout);
    }

    public ExecutionEngine(MetadataEngine metadataEngine) {
        this.metadataEngine = metadataEngine;
        this.sqlValidator = new SqlValidator(defaultMaxRows, defaultTimeout);
    }

    /**
     * Validate SQL
     */
    public SqlValidateResult validate(String sql) {
        return sqlValidator.validate(sql);
    }

    /**
     * Get SQL type
     */
    public String getSqlType(String sql) {
        return sqlValidator.getSqlType(sql);
    }

    /**
     * Format SQL
     */
    public String formatSql(String sql) {
        return sqlValidator.format(sql);
    }

    /**
     * Execute SQL query
     */
    public QueryResult executeQuery(String datasource, String schema, String sql, int maxRows) {
        // Validate first
        SqlValidateResult validation = sqlValidator.validate(sql);
        if (!validation.isValid()) {
            throw new RuntimeException("SQL validation failed: " + validation.getMessage());
        }

        QueryResult result = new QueryResult();
        result.setSqlType(validation.getSqlType());
        result.setWarnings(validation.getWarnings());

        try (Connection conn = metadataEngine.getConfigManager().hasDatasource(datasource) ?
                ConnectionPoolManager.getConnection(datasource) :
                throwNotFound(datasource)) {
            
            // Set schema if needed
            if (schema != null) {
                try {
                    conn.setSchema(schema);
                } catch (SQLException e) {
                    // Some databases may not support setSchema
                }
            }

            // Apply row limit for SELECT
            int effectiveMaxRows = maxRows > 0 ? Math.min(maxRows, defaultMaxRows) : defaultMaxRows;
            
            try (Statement stmt = conn.createStatement()) {
                stmt.setFetchSize(effectiveMaxRows);
                stmt.setMaxRows(effectiveMaxRows);
                
                boolean hasResults = stmt.execute(sql);
                
                if (hasResults) {
                    ResultSet rs = stmt.getResultSet();
                    ResultSetMetaData metaData = rs.getMetaData();
                    
                    // Column names
                    int columnCount = metaData.getColumnCount();
                    List<String> columns = new ArrayList<>();
                    for (int i = 1; i <= columnCount; i++) {
                        columns.add(metaData.getColumnLabel(i));
                    }
                    result.setColumns(columns);
                    
                    // Data rows
                    List<Map<String, Object>> rows = new ArrayList<>();
                    int rowCount = 0;
                    while (rs.next() && rowCount < effectiveMaxRows) {
                        Map<String, Object> row = new LinkedHashMap<>();
                        for (int i = 1; i <= columnCount; i++) {
                            Object value = rs.getObject(i);
                            // Handle special types for JSON serialization
                            if (value == null) {
                                value = null;
                            } else if (value instanceof java.sql.Date) {
                                value = value.toString();
                            } else if (value instanceof Timestamp) {
                                value = value.toString();
                            } else if (value instanceof java.time.LocalDateTime) {
                                value = value.toString();
                            } else if (value instanceof java.time.LocalDate) {
                                value = value.toString();
                            } else if (value instanceof java.time.LocalTime) {
                                value = value.toString();
                            } else if (value instanceof java.time.ZonedDateTime) {
                                value = value.toString();
                            } else if (value instanceof java.time.OffsetDateTime) {
                                value = value.toString();
                            } else if (value instanceof byte[]) {
                                value = "[BLOB]";
                            } else if (value instanceof Clob) {
                                Clob clob = (Clob) value;
                                value = clob.getSubString(1, Math.min((int) clob.length(), 1000));
                            }
                            row.put(columns.get(i - 1), value);
                        }
                        rows.add(row);
                        rowCount++;
                    }
                    result.setData(rows);
                    result.setRowCount(rows.size());
                    result.setLimited(rowCount >= effectiveMaxRows);
                } else {
                    // For INSERT, UPDATE, DELETE
                    int updateCount = stmt.getUpdateCount();
                    result.setRowCount(updateCount);
                    result.setData(new ArrayList<>());
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to execute SQL: " + e.getMessage(), e);
        }

        return result;
    }

    /**
     * Execute SELECT query with conditions
     */
    public QueryResult select(String datasource, String schema, String table, 
            String whereClause, List<String> columns, int maxRows) {
        StringBuilder sql = new StringBuilder("SELECT ");
        
        if (columns == null || columns.isEmpty()) {
            sql.append("*");
        } else {
            sql.append(String.join(", ", columns));
        }
        
        sql.append(" FROM ").append(table);
        
        if (whereClause != null && !whereClause.isEmpty()) {
            sql.append(" WHERE ").append(whereClause);
        }
        
        if (maxRows > 0) {
            sql.append(" LIMIT ").append(Math.min(maxRows, defaultMaxRows));
        }
        
        return executeQuery(datasource, schema, sql.toString(), maxRows);
    }

    /**
     * Insert data
     */
    public int insert(String datasource, String schema, String table, Map<String, Object> data) {
        if (data == null || data.isEmpty()) {
            throw new RuntimeException("No data provided for insert");
        }

        StringBuilder sql = new StringBuilder("INSERT INTO ");
        sql.append(table).append(" (");
        
        List<String> cols = new ArrayList<>(data.keySet());
        sql.append(String.join(", ", cols));
        sql.append(") VALUES (");
        
        List<String> placeholders = new ArrayList<>();
        for (int i = 0; i < cols.size(); i++) {
            placeholders.add("?");
        }
        sql.append(String.join(", ", placeholders));
        sql.append(")");

        // Validate
        SqlValidateResult validation = sqlValidator.validate(sql.toString());
        if (!validation.isValid()) {
            throw new RuntimeException("SQL validation failed: " + validation.getMessage());
        }

        try (Connection conn = ConnectionPoolManager.getConnection(datasource)) {
            if (schema != null) {
                try {
                    conn.setSchema(schema);
                } catch (SQLException e) {
                    // Ignore
                }
            }

            try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
                int idx = 1;
                for (String col : cols) {
                    Object value = data.get(col);
                    ps.setObject(idx++, value);
                }
                return ps.executeUpdate();
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to insert: " + e.getMessage(), e);
        }
    }

    /**
     * Update data
     */
    public int update(String datasource, String schema, String table, 
            Map<String, Object> data, String whereClause) {
        if (data == null || data.isEmpty()) {
            throw new RuntimeException("No data provided for update");
        }
        if (whereClause == null || whereClause.isEmpty()) {
            throw new RuntimeException("WHERE clause is required for UPDATE");
        }

        StringBuilder sql = new StringBuilder("UPDATE ");
        sql.append(table).append(" SET ");
        
        List<String> setClauses = new ArrayList<>();
        List<String> cols = new ArrayList<>(data.keySet());
        for (String col : cols) {
            setClauses.add(col + " = ?");
        }
        sql.append(String.join(", ", setClauses));
        sql.append(" WHERE ").append(whereClause);

        // Validate
        SqlValidateResult validation = sqlValidator.validate(sql.toString());
        if (!validation.isValid()) {
            throw new RuntimeException("SQL validation failed: " + validation.getMessage());
        }

        try (Connection conn = ConnectionPoolManager.getConnection(datasource)) {
            if (schema != null) {
                try {
                    conn.setSchema(schema);
                } catch (SQLException e) {
                    // Ignore
                }
            }

            try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {
                int idx = 1;
                for (String col : cols) {
                    Object value = data.get(col);
                    ps.setObject(idx++, value);
                }
                return ps.executeUpdate();
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to update: " + e.getMessage(), e);
        }
    }

    /**
     * Delete data
     */
    public int delete(String datasource, String schema, String table, String whereClause) {
        if (whereClause == null || whereClause.isEmpty()) {
            throw new RuntimeException("WHERE clause is required for DELETE");
        }

        StringBuilder sql = new StringBuilder("DELETE FROM ");
        sql.append(table).append(" WHERE ").append(whereClause);

        // Validate
        SqlValidateResult validation = sqlValidator.validate(sql.toString());
        if (!validation.isValid()) {
            throw new RuntimeException("SQL validation failed: " + validation.getMessage());
        }

        try (Connection conn = ConnectionPoolManager.getConnection(datasource)) {
            if (schema != null) {
                try {
                    conn.setSchema(schema);
                } catch (SQLException e) {
                    // Ignore
                }
            }

            try (Statement stmt = conn.createStatement()) {
                return stmt.executeUpdate(sql.toString());
            }
        } catch (Exception e) {
            throw new RuntimeException("Failed to delete: " + e.getMessage(), e);
        }
    }

    /**
     * Explain SQL
     */
    public QueryResult explain(String datasource, String schema, String sql) {
        String explainSql = "EXPLAIN " + sql;
        return executeQuery(datasource, schema, explainSql, 100);
    }

    private Connection throwNotFound(String datasource) throws SQLException {
        throw new SQLException("Datasource '" + datasource + "' not found");
    }

    public int getDefaultMaxRows() {
        return defaultMaxRows;
    }

    public void setDefaultMaxRows(int defaultMaxRows) {
        this.defaultMaxRows = defaultMaxRows;
        this.sqlValidator.setMaxRows(defaultMaxRows);
    }

    public int getDefaultTimeout() {
        return defaultTimeout;
    }

    public void setDefaultTimeout(int defaultTimeout) {
        this.defaultTimeout = defaultTimeout;
        this.sqlValidator.setTimeoutSeconds(defaultTimeout);
    }

    public MetadataEngine getMetadataEngine() {
        return metadataEngine;
    }
}
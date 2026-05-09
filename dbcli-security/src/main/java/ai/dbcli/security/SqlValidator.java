package ai.dbcli.security;

import ai.dbcli.dialect.SqlValidateResult;
import net.sf.jsqlparser.JSQLParserException;
import net.sf.jsqlparser.parser.CCJSqlParserUtil;
import net.sf.jsqlparser.statement.Statement;
import net.sf.jsqlparser.statement.delete.Delete;
import net.sf.jsqlparser.statement.drop.Drop;
import net.sf.jsqlparser.statement.insert.Insert;
import net.sf.jsqlparser.statement.select.Select;
import net.sf.jsqlparser.statement.truncate.Truncate;
import net.sf.jsqlparser.statement.update.Update;

import java.util.HashSet;
import java.util.Set;

/**
 * SQL validator for security checks
 */
public class SqlValidator {

    private static final Set<String> FORBIDDEN_OPERATIONS = new HashSet<>();

    static {
        FORBIDDEN_OPERATIONS.add("DROP DATABASE");
        FORBIDDEN_OPERATIONS.add("DROP SCHEMA");
        FORBIDDEN_OPERATIONS.add("TRUNCATE");
    }

    private int maxRows = 1000;
    private int timeoutSeconds = 30;

    public SqlValidator() {}

    public SqlValidator(int maxRows, int timeoutSeconds) {
        this.maxRows = maxRows;
        this.timeoutSeconds = timeoutSeconds;
    }

    /**
     * Validate SQL for security issues
     */
    public SqlValidateResult validate(String sql) {
        if (sql == null || sql.trim().isEmpty()) {
            return SqlValidateResult.invalid("EMPTY_SQL", "SQL is empty");
        }

        // Check forbidden operations first (before parsing)
        String sqlUpper = sql.toUpperCase().trim();
        for (String forbidden : FORBIDDEN_OPERATIONS) {
            if (sqlUpper.startsWith(forbidden)) {
                return SqlValidateResult.invalid("FORBIDDEN_OPERATION",
                        "SQL operation '" + forbidden + "' is not allowed");
            }
        }

        // Parse SQL
        Statement statement;
        try {
            statement = CCJSqlParserUtil.parse(sql);
        } catch (JSQLParserException e) {
            return SqlValidateResult.invalid("PARSE_ERROR", "Failed to parse SQL: " + e.getMessage());
        }

        SqlValidateResult result = new SqlValidateResult();

        // Check statement type
        if (statement instanceof Drop) {
            Drop drop = (Drop) statement;
            String type = drop.getType();
            if ("DATABASE".equals(type) || "SCHEMA".equals(type)) {
                return SqlValidateResult.invalid("FORBIDDEN_OPERATION",
                        "DROP DATABASE/SCHEMA is not allowed");
            }
            result.setSqlType("DROP");
        } else if (statement instanceof Truncate) {
            return SqlValidateResult.invalid("FORBIDDEN_OPERATION",
                    "TRUNCATE is not allowed");
        } else if (statement instanceof Select) {
            result.setSqlType("SELECT");
            // Add warning about row limit
            result.addWarning("Query results will be limited to " + maxRows + " rows");
        } else if (statement instanceof Insert) {
            result.setSqlType("INSERT");
        } else if (statement instanceof Update) {
            result.setSqlType("UPDATE");
            Update update = (Update) statement;
            if (update.getWhere() == null) {
                return SqlValidateResult.invalid("NO_WHERE_CLAUSE",
                        "UPDATE without WHERE clause is not allowed for safety");
            }
        } else if (statement instanceof Delete) {
            result.setSqlType("DELETE");
            Delete delete = (Delete) statement;
            if (delete.getWhere() == null) {
                return SqlValidateResult.invalid("NO_WHERE_CLAUSE",
                        "DELETE without WHERE clause is not allowed for safety");
            }
        } else {
            result.setSqlType("OTHER");
        }

        result.setValid(true);
        return result;
    }

    /**
     * Get SQL type (SELECT, INSERT, UPDATE, DELETE, etc.)
     */
    public String getSqlType(String sql) {
        if (sql == null || sql.trim().isEmpty()) {
            return "UNKNOWN";
        }

        try {
            Statement statement = CCJSqlParserUtil.parse(sql);
            if (statement instanceof Select) {
                return "SELECT";
            } else if (statement instanceof Insert) {
                return "INSERT";
            } else if (statement instanceof Update) {
                return "UPDATE";
            } else if (statement instanceof Delete) {
                return "DELETE";
            } else if (statement instanceof Drop) {
                return "DROP";
            } else if (statement instanceof Truncate) {
                return "TRUNCATE";
            } else {
                return "OTHER";
            }
        } catch (JSQLParserException e) {
            return "UNKNOWN";
        }
    }

    /**
     * Format SQL for better readability
     */
    public String format(String sql) {
        if (sql == null || sql.trim().isEmpty()) {
            return sql;
        }

        try {
            Statement statement = CCJSqlParserUtil.parse(sql);
            return statement.toString();
        } catch (JSQLParserException e) {
            return sql;
        }
    }

    public int getMaxRows() {
        return maxRows;
    }

    public void setMaxRows(int maxRows) {
        this.maxRows = maxRows;
    }

    public int getTimeoutSeconds() {
        return timeoutSeconds;
    }

    public void setTimeoutSeconds(int timeoutSeconds) {
        this.timeoutSeconds = timeoutSeconds;
    }
}
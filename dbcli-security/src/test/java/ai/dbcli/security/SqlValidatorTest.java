package ai.dbcli.security;

import ai.dbcli.dialect.SqlValidateResult;
import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Tests for SqlValidator
 */
class SqlValidatorTest {

    private SqlValidator validator;

    @BeforeEach
    void setup() {
        validator = new SqlValidator();
    }

    @Test
    void testValidSelect() {
        SqlValidateResult result = validator.validate("SELECT * FROM users");
        assertTrue(result.isValid(), "SELECT should be valid");
        assertEquals("SELECT", result.getSqlType());
    }

    @Test
    void testValidInsert() {
        SqlValidateResult result = validator.validate("INSERT INTO users (name) VALUES ('test')");
        assertTrue(result.isValid(), "INSERT should be valid");
        assertEquals("INSERT", result.getSqlType());
    }

    @Test
    void testValidUpdate() {
        SqlValidateResult result = validator.validate("UPDATE users SET name = 'new' WHERE id = 1");
        assertTrue(result.isValid(), "UPDATE with WHERE should be valid");
        assertEquals("UPDATE", result.getSqlType());
    }

    @Test
    void testValidDelete() {
        SqlValidateResult result = validator.validate("DELETE FROM users WHERE id = 1");
        assertTrue(result.isValid(), "DELETE with WHERE should be valid");
        assertEquals("DELETE", result.getSqlType());
    }

    @Test
    void testInvalidUpdateWithoutWhere() {
        SqlValidateResult result = validator.validate("UPDATE users SET name = 'new'");
        assertFalse(result.isValid(), "UPDATE without WHERE should be invalid");
        assertEquals("NO_WHERE_CLAUSE", result.getErrorCode());
    }

    @Test
    void testInvalidDeleteWithoutWhere() {
        SqlValidateResult result = validator.validate("DELETE FROM users");
        assertFalse(result.isValid(), "DELETE without WHERE should be invalid");
        assertEquals("NO_WHERE_CLAUSE", result.getErrorCode());
    }

    @Test
    void testForbiddenTruncate() {
        SqlValidateResult result = validator.validate("TRUNCATE TABLE users");
        assertFalse(result.isValid(), "TRUNCATE should be forbidden");
        assertEquals("FORBIDDEN_OPERATION", result.getErrorCode());
    }

    @Test
    void testForbiddenDropDatabase() {
        SqlValidateResult result = validator.validate("DROP DATABASE test");
        assertFalse(result.isValid(), "DROP DATABASE should be forbidden");
        assertEquals("FORBIDDEN_OPERATION", result.getErrorCode());
    }

    @Test
    void testEmptySql() {
        SqlValidateResult result = validator.validate("");
        assertFalse(result.isValid(), "Empty SQL should be invalid");
        assertEquals("EMPTY_SQL", result.getErrorCode());
    }

    @Test
    void testGetSqlType() {
        assertEquals("SELECT", validator.getSqlType("SELECT * FROM t"));
        assertEquals("INSERT", validator.getSqlType("INSERT INTO t VALUES (1)"));
        assertEquals("UPDATE", validator.getSqlType("UPDATE t SET a=1 WHERE b=2"));
        assertEquals("DELETE", validator.getSqlType("DELETE FROM t WHERE a=1"));
        assertEquals("UNKNOWN", validator.getSqlType("invalid sql"));
    }

    @Test
    void testFormatSql() {
        String formatted = validator.format("select * from users where id=1");
        assertNotNull(formatted);
        assertTrue(formatted.contains("SELECT"));
    }
}
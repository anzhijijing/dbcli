package ai.dbcli.dialect;

import java.sql.Driver;

/**
 * Database provider SPI interface
 */
public interface DatabaseProvider {

    /**
     * Get database type identifier
     */
    String type();

    /**
     * Get JDBC driver
     */
    Driver driver();

    /**
     * Get database dialect
     */
    DatabaseDialect dialect();

    /**
     * Build JDBC URL from configuration
     */
    String buildUrl(String host, Integer port, String database);
}
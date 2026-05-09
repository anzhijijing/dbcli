package ai.dbcli.dialect.dm;

import ai.dbcli.dialect.*;

import java.sql.Driver;

/**
 * DaMeng (DM) database provider
 * DaMeng is a Chinese database with its own JDBC driver
 */
public class DmProvider implements DatabaseProvider {

    @Override
    public String type() {
        return "dm";
    }

    @Override
    public Driver driver() {
        try {
            return new dm.jdbc.driver.DmDriver();
        } catch (Exception e) {
            throw new RuntimeException("Failed to load DaMeng driver", e);
        }
    }

    @Override
    public DatabaseDialect dialect() {
        return new DmDialect();
    }

    @Override
    public String buildUrl(String host, Integer port, String database) {
        int p = port != null ? port : 5236;
        // DaMeng URL format with encoding parameter to avoid string encode fail
        return String.format("jdbc:dm://%s:%d/%s?ClientEncoding=unicode", host, p, database);
    }
}
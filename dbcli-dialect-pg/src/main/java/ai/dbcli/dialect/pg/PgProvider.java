package ai.dbcli.dialect.pg;

import ai.dbcli.dialect.*;

import java.sql.Driver;

/**
 * PostgreSQL database provider
 */
public class PgProvider implements DatabaseProvider {

    @Override
    public String type() {
        return "postgresql";
    }

    @Override
    public Driver driver() {
        try {
            return new org.postgresql.Driver();
        } catch (Exception e) {
            throw new RuntimeException("Failed to load PostgreSQL driver", e);
        }
    }

    @Override
    public DatabaseDialect dialect() {
        return new PgDialect();
    }

    @Override
    public String buildUrl(String host, Integer port, String database) {
        int p = port != null ? port : 5432;
        return String.format("jdbc:postgresql://%s:%d/%s", host, p, database);
    }
}
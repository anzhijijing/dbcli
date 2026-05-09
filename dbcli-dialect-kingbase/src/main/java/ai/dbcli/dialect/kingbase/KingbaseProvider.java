package ai.dbcli.dialect.kingbase;

import ai.dbcli.dialect.*;

import java.sql.Driver;

/**
 * KingbaseES database provider
 * Kingbase is a Chinese database based on PostgreSQL
 */
public class KingbaseProvider implements DatabaseProvider {

    @Override
    public String type() {
        return "kingbase";
    }

    @Override
    public Driver driver() {
        try {
            return new com.kingbase8.Driver();
        } catch (Exception e) {
            throw new RuntimeException("Failed to load Kingbase driver", e);
        }
    }

    @Override
    public DatabaseDialect dialect() {
        return new KingbaseDialect();
    }

    @Override
    public String buildUrl(String host, Integer port, String database) {
        int p = port != null ? port : 54321;
        // Kingbase URL format, similar to PostgreSQL
        return String.format("jdbc:kingbase8://%s:%d/%s", host, p, database);
    }
}
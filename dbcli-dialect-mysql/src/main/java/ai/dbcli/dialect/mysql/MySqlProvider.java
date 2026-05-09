package ai.dbcli.dialect.mysql;

import ai.dbcli.dialect.*;

import java.sql.Driver;

/**
 * MySQL database provider
 */
public class MySqlProvider implements DatabaseProvider {

    @Override
    public String type() {
        return "mysql";
    }

    @Override
    public Driver driver() {
        try {
            return new com.mysql.cj.jdbc.Driver();
        } catch (Exception e) {
            throw new RuntimeException("Failed to load MySQL driver", e);
        }
    }

    @Override
    public DatabaseDialect dialect() {
        return new MySqlDialect();
    }

    @Override
    public String buildUrl(String host, Integer port, String database) {
        int p = port != null ? port : 3306;
        return String.format("jdbc:mysql://%s:%d/%s?useSSL=false&allowPublicKeyRetrieval=true", 
                host, p, database);
    }
}
package ai.dbcli.jdbc;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Connection pool manager using HikariCP
 */
public class ConnectionPoolManager {

    private static final Map<String, HikariDataSource> pools = new ConcurrentHashMap<>();

    /**
     * Create or get connection pool for a datasource
     */
    public static HikariDataSource getOrCreatePool(DatasourceConfig config) {
        return pools.computeIfAbsent(config.getName(), name -> createPool(config));
    }

    private static HikariDataSource createPool(DatasourceConfig config) {
        HikariConfig hikariConfig = new HikariConfig();

        hikariConfig.setJdbcUrl(config.getUrl());
        hikariConfig.setUsername(config.getUsername());
        hikariConfig.setPassword(config.getPassword());
        hikariConfig.setDriverClassName(config.getDriverClassName());

        // Pool configuration
        hikariConfig.setMaximumPoolSize(10);
        hikariConfig.setMinimumIdle(2);
        hikariConfig.setIdleTimeout(30000);
        hikariConfig.setConnectionTimeout(30000);
        hikariConfig.setMaxLifetime(1800000);
        hikariConfig.setPoolName("dbcli-" + config.getName());

        // Connection validation
        hikariConfig.setConnectionTestQuery(config.getValidationQuery());

        return new HikariDataSource(hikariConfig);
    }

    /**
     * Get connection from pool
     */
    public static Connection getConnection(String datasourceName) throws SQLException {
        HikariDataSource pool = pools.get(datasourceName);
        if (pool == null) {
            throw new SQLException("Datasource '" + datasourceName + "' not found");
        }
        return pool.getConnection();
    }

    /**
     * Test connection to datasource
     */
    public static boolean ping(String datasourceName) {
        HikariDataSource pool = pools.get(datasourceName);
        if (pool == null) {
            return false;
        }
        try (Connection conn = pool.getConnection()) {
            return conn.isValid(5);
        } catch (SQLException e) {
            return false;
        }
    }

    /**
     * Close and remove pool
     */
    public static void closePool(String datasourceName) {
        HikariDataSource pool = pools.remove(datasourceName);
        if (pool != null && !pool.isClosed()) {
            pool.close();
        }
    }

    /**
     * Close all pools
     */
    public static void closeAll() {
        pools.forEach((name, pool) -> {
            if (!pool.isClosed()) {
                pool.close();
            }
        });
        pools.clear();
    }

    /**
     * Check if pool exists
     */
    public static boolean hasPool(String datasourceName) {
        return pools.containsKey(datasourceName);
    }

    /**
     * Get pool status
     */
    public static PoolStatus getPoolStatus(String datasourceName) {
        HikariDataSource pool = pools.get(datasourceName);
        if (pool == null) {
            return null;
        }
        PoolStatus status = new PoolStatus();
        status.setName(datasourceName);
        status.setActiveConnections(pool.getHikariPoolMXBean().getActiveConnections());
        status.setIdleConnections(pool.getHikariPoolMXBean().getIdleConnections());
        status.setTotalConnections(pool.getHikariPoolMXBean().getTotalConnections());
        status.setThreadsAwaitingConnection(pool.getHikariPoolMXBean().getThreadsAwaitingConnection());
        return status;
    }
}
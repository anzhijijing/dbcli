package ai.dbcli.jdbc;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Configuration manager for datasources
 * Config file location: ~/.dbcli/config.yaml
 */
public class ConfigManager {

    private static final String CONFIG_DIR = ".dbcli";
    private static final String CONFIG_FILE = "config.yaml";
    private static final ObjectMapper yamlMapper = new ObjectMapper(new YAMLFactory());

    private final Path configPath;
    private final Map<String, DatasourceConfig> datasources = new HashMap<>();

    public ConfigManager() {
        String home = System.getProperty("user.home");
        Path configDir = Paths.get(home, CONFIG_DIR);
        this.configPath = configDir.resolve(CONFIG_FILE);
        load();
    }

    /**
     * Load configuration from file
     */
    public void load() {
        if (!Files.exists(configPath)) {
            return;
        }

        try {
            Map<String, Object> config = yamlMapper.readValue(configPath.toFile(), Map.class);
            Object datasourcesObj = config.get("datasources");
            if (datasourcesObj instanceof Map) {
                Map<String, Map<String, Object>> dsMap = (Map<String, Map<String, Object>>) datasourcesObj;
                for (Map.Entry<String, Map<String, Object>> entry : dsMap.entrySet()) {
                    DatasourceConfig ds = parseDatasourceConfig(entry.getKey(), entry.getValue());
                    datasources.put(entry.getKey(), ds);
                    // Initialize connection pool for loaded datasource
                    ConnectionPoolManager.getOrCreatePool(ds);
                }
            }
        } catch (IOException e) {
            throw new RuntimeException("Failed to load config: " + e.getMessage(), e);
        }
    }

    /**
     * Save configuration to file
     */
    public void save() {
        try {
            Files.createDirectories(configPath.getParent());

            Map<String, Object> config = new HashMap<>();
            Map<String, Map<String, Object>> dsMap = new HashMap<>();
            for (Map.Entry<String, DatasourceConfig> entry : datasources.entrySet()) {
                dsMap.put(entry.getKey(), serializeDatasourceConfig(entry.getValue()));
            }
            config.put("datasources", dsMap);

            yamlMapper.writeValue(configPath.toFile(), config);
        } catch (IOException e) {
            throw new RuntimeException("Failed to save config: " + e.getMessage(), e);
        }
    }

    private DatasourceConfig parseDatasourceConfig(String name, Map<String, Object> data) {
        DatasourceConfig config = new DatasourceConfig();
        config.setName(name);
        config.setType((String) data.get("type"));
        config.setHost((String) data.get("host"));
        config.setPort(data.get("port") != null ? (Integer) data.get("port") : null);
        config.setDatabase((String) data.get("database"));
        config.setUsername((String) data.get("username"));
        config.setPassword((String) data.get("password"));
        config.setUrl((String) data.get("url"));
        config.setDriverClassName((String) data.get("driverClassName"));

        // Set defaults based on type
        if (config.getType() != null) {
            setDefaultsForType(config);
        }

        return config;
    }

    private Map<String, Object> serializeDatasourceConfig(DatasourceConfig config) {
        Map<String, Object> data = new HashMap<>();
        data.put("type", config.getType());
        data.put("host", config.getHost());
        if (config.getPort() != null) {
            data.put("port", config.getPort());
        }
        data.put("database", config.getDatabase());
        data.put("username", config.getUsername());
        data.put("password", config.getPassword());
        if (config.getUrl() != null) {
            data.put("url", config.getUrl());
        }
        return data;
    }

    private void setDefaultsForType(DatasourceConfig config) {
        String type = config.getType().toLowerCase();
        switch (type) {
            case "mysql":
                if (config.getPort() == null) config.setPort(3306);
                if (config.getDriverClassName() == null) {
                    config.setDriverClassName("com.mysql.cj.jdbc.Driver");
                }
                if (config.getValidationQuery() == null) {
                    config.setValidationQuery("SELECT 1");
                }
                if (config.getUrl() == null) {
                    config.setUrl(String.format("jdbc:mysql://%s:%d/%s?useSSL=false&allowPublicKeyRetrieval=true",
                            config.getHost(), config.getPort(), config.getDatabase()));
                }
                break;
            case "postgresql":
            case "pg":
                if (config.getPort() == null) config.setPort(5432);
                if (config.getDriverClassName() == null) {
                    config.setDriverClassName("org.postgresql.Driver");
                }
                if (config.getValidationQuery() == null) {
                    config.setValidationQuery("SELECT 1");
                }
                if (config.getUrl() == null) {
                    config.setUrl(String.format("jdbc:postgresql://%s:%d/%s",
                            config.getHost(), config.getPort(), config.getDatabase()));
                }
                break;
            case "kingbase":
                if (config.getPort() == null) config.setPort(54321);
                if (config.getDriverClassName() == null) {
                    config.setDriverClassName("com.kingbase8.Driver");
                }
                if (config.getValidationQuery() == null) {
                    config.setValidationQuery("SELECT 1");
                }
                if (config.getUrl() == null) {
                    config.setUrl(String.format("jdbc:kingbase8://%s:%d/%s",
                            config.getHost(), config.getPort(), config.getDatabase()));
                }
                break;
            case "dm":
            case "dameng":
                if (config.getPort() == null) config.setPort(5236);
                if (config.getDriverClassName() == null) {
                    config.setDriverClassName("dm.jdbc.driver.DmDriver");
                }
                if (config.getValidationQuery() == null) {
                    config.setValidationQuery("SELECT 1");
                }
                if (config.getUrl() == null) {
                    // Add ClientEncoding=unicode to avoid string encode fail
                    config.setUrl(String.format("jdbc:dm://%s:%d/%s?ClientEncoding=unicode",
                            config.getHost(), config.getPort(), config.getDatabase()));
                }
                break;
            default:
                // Unknown type, use provided values
                break;
        }
    }

    /**
     * Add a datasource configuration
     */
    public void addDatasource(DatasourceConfig config) {
        if (config.getType() != null) {
            setDefaultsForType(config);
        }
        datasources.put(config.getName(), config);
        save();
    }

    /**
     * Remove a datasource configuration
     */
    public void removeDatasource(String name) {
        datasources.remove(name);
        ConnectionPoolManager.closePool(name);
        save();
    }

    /**
     * Get a datasource configuration
     */
    public DatasourceConfig getDatasource(String name) {
        return datasources.get(name);
    }

    /**
     * List all datasource configurations
     */
    public List<DatasourceConfig> listDatasources() {
        return new ArrayList<>(datasources.values());
    }

    /**
     * Check if datasource exists
     */
    public boolean hasDatasource(String name) {
        return datasources.containsKey(name);
    }

    /**
     * Get config file path
     */
    public Path getConfigPath() {
        return configPath;
    }
}
package ai.dbcli.cli.commands;

import ai.dbcli.cli.DbCli;
import ai.dbcli.core.*;
import ai.dbcli.jdbc.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import java.util.concurrent.Callable;

/**
 * Datasource commands
 */
@Command(
    name = "datasource",
    description = "Datasource management commands",
    subcommands = {
        DatasourceCommand.Add.class,
        DatasourceCommand.ListDs.class,
        DatasourceCommand.Get.class,
        DatasourceCommand.Remove.class,
        DatasourceCommand.Ping.class
    }
)
public class DatasourceCommand implements Runnable {

    @CommandLine.ParentCommand
    DbCli parent;

    @Override
    public void run() {
        System.out.println("Use 'datasource --help' to see subcommands");
    }

    @Command(name = "add", description = "Add a new datasource")
    static class Add implements Callable<Integer> {

        @CommandLine.ParentCommand
        DatasourceCommand parent;

        @CommandLine.Parameters(index = "0", description = "Datasource name")
        String name;

        @CommandLine.Option(names = {"--type"}, required = true, description = "Database type: mysql, postgresql")
        String type;

        @CommandLine.Option(names = {"--host"}, required = true, description = "Host address")
        String host;

        @CommandLine.Option(names = {"--port"}, description = "Port number")
        Integer port;

        @CommandLine.Option(names = {"--database", "-d"}, required = true, description = "Database name")
        String database;

        @CommandLine.Option(names = {"--username", "-u"}, required = true, description = "Username")
        String username;

        @CommandLine.Option(names = {"--password", "-p"}, required = true, description = "Password")
        String password;

        @CommandLine.Option(names = {"--url"}, description = "Custom JDBC URL")
        String url;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                DatasourceConfig config;
                
                if (url != null) {
                    config = new DatasourceConfig();
                    config.setName(name);
                    config.setType(type);
                    config.setUrl(url);
                    config.setUsername(username);
                    config.setPassword(password);
                    if (type.equalsIgnoreCase("mysql")) {
                        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
                        config.setValidationQuery("SELECT 1");
                    } else {
                        config.setDriverClassName("org.postgresql.Driver");
                        config.setValidationQuery("SELECT 1");
                    }
                    engine.addDatasource(config);
                } else {
                    config = engine.addDatasource(name, type, host, port, database, username, password);
                }
                
                // Test connection
                boolean connected = engine.pingDatasource(name);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                ApiResponse response;
                if (connected) {
                    response = formatter.success(config);
                    System.out.println("Datasource '" + name + "' added successfully");
                } else {
                    response = formatter.error("CONNECTION_FAILED", "Failed to connect to datasource");
                    System.out.println("Warning: Could not connect to datasource");
                }
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(response));
                }
                
                return connected ? 0 : 1;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "list", description = "List all datasources")
    static class ListDs implements Callable<Integer> {

        @CommandLine.ParentCommand
        DatasourceCommand parent;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                java.util.List<DatasourceConfig> datasources = engine.listDatasources();
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(datasources)));
                } else {
                    System.out.println(formatter.formatList(datasources, new String[]{"name", "type", "host", "database"}));
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "get", description = "Get datasource details")
    static class Get implements Callable<Integer> {

        @CommandLine.ParentCommand
        DatasourceCommand parent;

        @CommandLine.Parameters(index = "0", description = "Datasource name")
        String name;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                DatasourceConfig config = engine.getDatasource(name);
                
                if (config == null) {
                    System.err.println("Datasource '" + name + "' not found");
                    return 1;
                }
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    System.out.println(mapper.writeValueAsString(formatter.success(config)));
                } else {
                    System.out.println("Name: " + config.getName());
                    System.out.println("Type: " + config.getType());
                    System.out.println("Host: " + config.getHost());
                    System.out.println("Port: " + config.getPort());
                    System.out.println("Database: " + config.getDatabase());
                    System.out.println("URL: " + config.getUrl());
                }
                
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "remove", description = "Remove a datasource")
    static class Remove implements Callable<Integer> {

        @CommandLine.ParentCommand
        DatasourceCommand parent;

        @CommandLine.Parameters(index = "0", description = "Datasource name")
        String name;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                engine.removeDatasource(name);
                System.out.println("Datasource '" + name + "' removed");
                return 0;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }

    @Command(name = "ping", description = "Test datasource connection")
    static class Ping implements Callable<Integer> {

        @CommandLine.ParentCommand
        DatasourceCommand parent;

        @CommandLine.Parameters(index = "0", description = "Datasource name")
        String name;

        @Override
        public Integer call() {
            try {
                MetadataEngine engine = new MetadataEngine();
                boolean connected = engine.pingDatasource(name);
                
                OutputFormatter formatter = new OutputFormatter(parent.parent.getOutputFormat());
                
                if (parent.parent.getOutputFormat().equals("json")) {
                    ObjectMapper mapper = new ObjectMapper();
                    ApiResponse response = new ApiResponse();
                    response.setSuccess(connected);
                    response.setData(connected ? "connected" : "disconnected");
                    System.out.println(mapper.writeValueAsString(response));
                } else {
                    System.out.println(connected ? "Connected" : "Not connected");
                }
                
                return connected ? 0 : 1;
            } catch (Exception e) {
                System.err.println("Error: " + e.getMessage());
                return 1;
            }
        }
    }
}
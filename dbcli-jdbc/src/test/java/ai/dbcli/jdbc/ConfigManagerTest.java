package ai.dbcli.jdbc;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * ConfigManager 加载 config.yaml 时只应解析配置，不得在加载阶段建立任何数据库连接。
 * 若 config.yaml 中存在无法连接的数据源，加载过程必须照常完成，不能拖垮其他命令。
 */
class ConfigManagerTest {

    @TempDir
    Path tempHome;

    private String originalHome;

    @BeforeEach
    void rememberHome() {
        originalHome = System.getProperty("user.home");
    }

    @AfterEach
    void restoreHome() {
        System.setProperty("user.home", originalHome);
    }

    @Test
    void loadMustNotCreatePoolsForUnreachableDatasources() throws Exception {
        Path dbcliDir = tempHome.resolve(".dbcli");
        Files.createDirectories(dbcliDir);

        // 两个数据源都指向 127.0.0.1:1（必然连接失败），用于验证加载阶段不触碰网络
        String yaml = "datasources:\n" +
                "  fake-unreachable:\n" +
                "    type: mysql\n" +
                "    host: 127.0.0.1\n" +
                "    port: 1\n" +
                "    database: none\n" +
                "    username: user\n" +
                "    password: pass\n" +
                "  target-db:\n" +
                "    type: mysql\n" +
                "    host: 127.0.0.1\n" +
                "    port: 1\n" +
                "    database: none\n" +
                "    username: user\n" +
                "    password: pass\n";
        Files.write(dbcliDir.resolve("config.yaml"), yaml.getBytes(StandardCharsets.UTF_8));

        System.setProperty("user.home", tempHome.toString());

        ConfigManager manager = new ConfigManager();

        assertTrue(manager.hasDatasource("fake-unreachable"), "配置应照常加载");
        assertTrue(manager.hasDatasource("target-db"), "配置应照常加载");
        assertFalse(ConnectionPoolManager.hasPool("fake-unreachable"), "加载阶段不应为数据源创建连接池");
        assertFalse(ConnectionPoolManager.hasPool("target-db"), "加载阶段不应为数据源创建连接池");
    }
}

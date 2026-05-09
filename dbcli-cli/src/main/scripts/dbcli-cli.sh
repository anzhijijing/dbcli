#!/bin/bash
# DBCLI 启动脚本 - 使用 Java 运行以支持达梦等国产数据库
JAVA_HOME=/home/mc/.jdks/corretto-17.0.13-1
exec "$JAVA_HOME/bin/java" -jar "$(dirname "$0")/dbcli-cli-1.0.0-SNAPSHOT-jar-with-dependencies.jar" "$@"

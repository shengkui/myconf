#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

#Check HDFS daemon
jps | grep " NameNode" &>/dev/null
if [ $? -ne 0 ];then
    echo "=========================================="
    echo "    Start HDFS daemon"
    echo "=========================================="
    cd "$HADOOP_HOME" || { echo "HADOOP_HOME not set" ; exit 1; }
    sbin/start-dfs.sh
fi

jps | grep DataNode &>/dev/null
if [ $? -ne 0 ];then
    echo "DataNode daemon not running!"
    exit 1
fi

#Check Flink daemon
jps | grep TaskManagerRunner &>/dev/null
if [ $? -ne 0 ];then
    echo "=========================================="
    echo "    Start Flink cluster"
    echo "=========================================="
    start-cluster.sh
fi

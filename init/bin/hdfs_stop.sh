#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

cd "$HADOOP_HOME" || { echo "HADOOP_HOME not set" ; exit 1; }

HDFS_CMD=bin/hdfs
HADOOP_CMD=bin/hadoop

#Stop HDFS daemon
sbin/stop-dfs.sh

#rm -rf "/tmp/hadoop"

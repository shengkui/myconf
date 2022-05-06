#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

stop-cluster.sh

cd "$HADOOP_HOME" || { echo "HADOOP_HOME not set" ; exit 1; }
sbin/stop-dfs.sh

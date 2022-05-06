#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

#Start flink-sql-client shell
echo "=========================================="
echo "    Start Flink SQL Client Shell"
echo "=========================================="
#sql-client.sh embedded -j "$HOME/iceberg/iceberg-flink-runtime-0.11.0.jar" shell
#sql-client.sh embedded -j "$HOME/flink/lib/flink-sql-connector-hive-3.1.2_2.12-1.12.5.jar" \
#    -j "$HOME/flink/lib/iceberg-flink-runtime-0.12.0.jar" shell
~/flink/bin/sql-client.sh embedded shell

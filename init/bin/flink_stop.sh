#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

~/flink/bin/stop-cluster.sh

rm -rf ~/flink/log/flink-*

#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

cd ~/kafka || { echo "fail to enter kafka directory"; exit 1; }

#Consumer
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic flink-input #--from-beginning

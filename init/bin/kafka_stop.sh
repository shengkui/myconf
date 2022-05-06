#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

cd ~/kafka || { echo "fail to enter kafka directory"; exit 1; }

#Start Zookeeper
bin/zookeeper-server-stop.sh
sleep 1

#Start Kafka broker
bin/kafka-server-stop.sh
sleep 1

rm -rf /tmp/kafka-logs
rm -rf /tmp/zookeeper

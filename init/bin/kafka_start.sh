#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

cd ~/kafka || { echo "fail to enter kafka directory"; exit 1; }

#Start Zookeeper
bin/zookeeper-server-start.sh config/zookeeper.properties &
sleep 1

#Start Kafka broker
bin/kafka-server-start.sh config/server.properties &
sleep 1

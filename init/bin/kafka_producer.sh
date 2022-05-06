#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

cd ~/kafka || { echo "fail to enter kafka directory"; exit 1; }

#Create Kafka topic "flink-demo"
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 4 --topic flink-demo

#Producer
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic flink-demo

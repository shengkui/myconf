#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $(basename "$0") <java app name>"
    exit 1
fi
java_app=$1

pids=( $(jps | grep "$java_app" | awk '{print $1}') )

for pid in "${pids[@]}"; do
    echo "killing $pid"
    kill "$pid"
done

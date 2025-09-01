#!/bin/bash
# Stop hive metastore service
#

process="hive-metastore"
PID=$(ps -ef | grep $process | grep -v grep | awk '{print $2}')
if [ ! -z "$PID" ];then
    echo "Kill hive metastore process: $PID ..."
    kill $PID
fi

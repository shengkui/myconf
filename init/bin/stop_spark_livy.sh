#!/bin/bash

DIS_DIR=/mnt/storage/dis-develop
LIVY_HOME=${DIS_DIR}/dis-livy

echo; echo "=============Stop Livy============="
pushd . > /dev/null
cd $LIVY_HOME && ./bin/livy-server stop
popd > /dev/null

echo; echo "=============Stop Spark============="
${SPARK_HOME}/sbin/stop-all.sh

#${SPARK_HOME}/sbin/stop-history-server.sh

echo;echo "=============Kill sql-rest.py============="
sql_rest=$(ps aux | grep -v grep | grep "sql-rest.py" | awk '{print $2}')
if [[ ! -z "$sql_rest" ]]; then
    kill $sql_rest
fi

echo; echo "=============Kill Hive metastore service============="
hive_pid=$(ps -ef | grep "hive-metastore" | grep -v grep | awk '{print $2}')
if [ ! -z "$hive_pid" ];then
    kill $hive_pid
fi

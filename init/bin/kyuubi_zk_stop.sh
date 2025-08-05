#!/bin/bash

WORK_DIR=/mnt/storage
KYUUBI_HOME=${WORK_DIR}/dis-develop/dis-kyuubi/dist
ZOOKEEPER_HOME=${WORK_DIR}/dis-develop/zookeeper

echo; echo "=============Stop Kyuubi============="
cd ${KYUUBI_HOME} && bin/kyuubi stop
sleep 1

echo; echo "=============Stop Spark============="
${SPARK_HOME}/sbin/stop-all.sh
sleep 1

echo;echo "=============Kill sql-rest.py============="
sql_rest=$(ps aux | grep -v grep | grep "sql-rest.py" | awk '{print $2}')
if [[ ! -z "$sql_rest" ]]; then
    kill $sql_rest
fi

echo; echo "=============Stop Zookeeper============="
cd ${ZOOKEEPER_HOME} && bin/zkServer.sh stop

echo; echo "=============Kill Hive metastore service============="
hive_pid=$(ps -ef | grep "hive-metastore" | grep -v grep | awk '{print $2}')
if [ ! -z "$hive_pid" ];then
    kill $hive_pid
fi

#!/bin/bash

KYUUBI_HOME=${HOME}/dis-develop/dis-kyuubi
ZOOKEEPER_HOME=${HOME}/zookeeper

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

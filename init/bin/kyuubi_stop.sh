#!/bin/bash

KYUUBI_HOME=${HOME}/kyuubi_mod
ZOOKEEPER_HOME=${HOME}/zookeeper

echo; echo "=============Stop Kyuubi============="
cd ${KYUUBI_HOME} && bin/kyuubi stop
sleep 1

echo; echo "=============Stop Spark============="
${SPARK_HOME}/sbin/stop-all.sh
sleep 1

echo; echo "=============Stop Zookeeper============="
cd ${ZOOKEEPER_HOME} && bin/zkServer.sh stop

#!/bin/bash

WORK_DIR=/mnt/storage
KYUUBI_HOME=${WORK_DIR}/dis-develop/dis-kyuubi/dist
ZOOKEEPER_HOME=${WORK_DIR}/dis-develop/zookeeper
export HIVE_HOME=/mnt/storage/dis-develop/hive

echo "======== KYUUBI_HOME: $KYUUBI_HOME ========"

echo; echo "=============Start Hive metastore service============="
cd $HIVE_HOME && rm -f nohup.out && nohup bin/hive --service metastore &

echo; echo "=============Start Zookeeper============="
cd $ZOOKEEPER_HOME && bin/zkServer.sh start
sleep 1

echo; echo "=============Start Spark============="
${SPARK_HOME}/sbin/start-all.sh
sleep 1

echo; echo "=============Start Kyuubi============="
cd ${KYUUBI_HOME} && bin/kyuubi start

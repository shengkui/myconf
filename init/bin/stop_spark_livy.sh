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

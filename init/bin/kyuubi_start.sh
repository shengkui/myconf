#!/bin/bash

KYUUBI_HOME=${HOME}/dis-develop/dis-kyuubi

echo; echo "=============Start Spark============="
${SPARK_HOME}/sbin/start-all.sh
sleep 1

echo; echo "=============Start Kyuubi============="
cd ${KYUUBI_HOME} && bin/kyuubi start

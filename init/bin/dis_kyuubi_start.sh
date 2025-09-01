#!/bin/bash
# This script will start Zookeeper, Spark, Kyuubi and DIS-API. DIS-API is running at foreground, 
# If you press CTRL-C to terminate DIS-API process, this script will stop Spark, Kyuubi and Zookeeper
# too.

WORK_DIR=/mnt/storage
KYUUBI_HOME=${WORK_DIR}/dis-develop/dis-kyuubi
DISAPI_HOME=${WORK_DIR}/dis-develop/dis-api
ZOOKEEPER_HOME=${WORK_DIR}/dis-develop/zookeeper

term_exit()
{
    echo; echo "=============Stop Kyuubi============="
    pushd . > /dev/null
    cd ${KYUUBI_HOME} && bin/kyuubi stop
    popd > /dev/null

    echo; echo "=============Stop Spark============="
    ${SPARK_HOME}/sbin/stop-all.sh

    #${SPARK_HOME}/sbin/stop-history-server.sh

    echo; echo "=============Kill sql-rest.py============="
    sql_rest=$(ps aux | grep -v grep | grep "sql-rest.py" | awk '{print $2}')
    if [[ ! -z "$sql_rest" ]]; then
        kill $sql_rest
    fi

    echo; echo "=============Stop Zookeeper============="
    cd ${ZOOKEEPER_HOME} && bin/zkServer.sh stop

    exit 0
}
trap term_exit TERM INT

echo; echo "=============Start Zookeeper============="
pushd . > /dev/null
cd ${ZOOKEEPER_HOME} && bin/zkServer.sh start
popd > /dev/null

sleep 1

echo; echo "=============Start Spark============="
${SPARK_HOME}/sbin/start-all.sh
sleep 1

#echo; echo "=============Start Spark History Server============="
#${SPARK_HOME}/sbin/start-history-server.sh

echo; echo "=============Start Kyuubi============="
pushd . > /dev/null
cd ${KYUUBI_HOME} && bin/kyuubi start
popd > /dev/null

echo; echo "=============Start DIS-API============="
pushd . > /dev/null
cd ${DISAPI_HOME} && ./bin/dis-api
popd > /dev/null

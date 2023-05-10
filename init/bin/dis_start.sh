#!/bin/bash
#This script will start Spark, Livy and DIS-API. DIS-API is running in forground, recommand to run
#this script in SCREEN. If you press CTRL-C to terminate DIS-API process, this script will stop
#Spark and Livy too.

DIS_DIR=${HOME}/repo/dis
LIVY_HOME=${DIS_DIR}/dis-livy
DISAPI_HOME=${DIS_DIR}/dis-api


term_exit()
{
    echo "=============Stop Livy============="
    pushd . > /dev/null
    cd $LIVY_HOME && ./bin/livy-server stop
    popd > /dev/null

    echo
    echo "=============Stop Spark============="
    ${SPARK_HOME}/sbin/stop-all.sh

    #${SPARK_HOME}/sbin/stop-history-server.sh

    echo "=============Kill sql-rest.py============="
    sql_rest=$(ps aux | grep -v grep | grep "python3 sql-rest.py" | awk '{print $2}')
    if [[ ! -z "$sql_rest" ]]; then
        kill $sql_rest
    fi

    exit 0
}
trap term_exit TERM INT


echo
echo "=============Start Spark============="
${SPARK_HOME}/sbin/start-all.sh

#echo
#echo "=============Start Spark History Server============="
#${SPARK_HOME}/sbin/start-history-server.sh

echo
echo "=============Start Livy============="
pushd . > /dev/null
cd $LIVY_HOME && ./bin/livy-server start
popd > /dev/null

echo
echo "=============Start DIS-API============="
pushd . > /dev/null
cd $DISAPI_HOME && go run main.go
popd > /dev/null

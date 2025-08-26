#!/bin/bash

DIS_DIR=/mnt/storage/dis-develop
LIVY_HOME=${DIS_DIR}/dis-livy

term_exit()
{
    echo; echo "=============Stop Spark============="
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

echo; echo "=============Start Hive metastore service============="
cd $HIVE_HOME && rm -f nohup.out && nohup bin/hive --service metastore &
echo; echo "=============Start Spark============="
${SPARK_HOME}/sbin/start-all.sh

#echo; echo "=============Start Spark History Server============="
#${SPARK_HOME}/sbin/start-history-server.sh

echo; echo "=============Start Livy============="
pushd . > /dev/null
cd $LIVY_HOME || { echo "Enter $LIVY_HOME fail" ; exit 1; }
if [ -f conf/livy.conf ] ;then
    ./bin/livy-server     #start
else
    echo "NO livy.conf found!"
    exit 1
fi
popd > /dev/null

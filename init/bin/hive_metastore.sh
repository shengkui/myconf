#!/bin/bash
# Start hive metastore service
#

#export JAVA_HOME=/usr/lib/jvm/java/

#export HADOOP_HOME=/home/shengkui.leng/hadoop
#export HADOOP_CLASSPATH=`$HADOOP_HOME/bin/hadoop classpath`
#export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HADOOP_HOME/share/hadoop/tools/lib/*

#export HIVE_HOME=/home/shengkui.leng/hive

cd $HIVE_HOME
rm nohup.out
nohup bin/hive --service metastore &

#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

cd "$HADOOP_HOME" || { echo "HADOOP_HOME not set" ; exit 1; }

HDFS_CMD=bin/hdfs
HADOOP_CMD=bin/hadoop

#Format HDFS
$HDFS_CMD namenode -format

$HDFS_CMD getconf -namenodes

#Start HDFS daemon
sbin/start-dfs.sh

#List jvm
jps

#Create home directory for user
#$HDFS_CMD dfs -mkdir -p /user/shengkui.leng

#------------------------------------------------------------------------------
# Run an example
#------------------------------------------------------------------------------
#$HDFS_CMD dfs -mkdir input
#$HDFS_CMD dfs -put etc/hadoop/*.xml input

#$HADOOP_CMD jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.4.jar grep input output 'dfs[a-z.]+'

#$HDFS_CMD dfs -ls output
#$HDFS_CMD dfs -cat output/part-r-00000

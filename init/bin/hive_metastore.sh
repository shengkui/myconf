export JAVA_HOME=/usr/lib/jvm/java/

export HADOOP_HOME=/home/shengkui.leng/hadoop
export HADOOP_CLASSPATH=`$HADOOP_HOME/bin/hadoop classpath`
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HADOOP_HOME/share/hadoop/tools/lib/*

export HIVE_HOME=/home/shengkui.leng/hive

export PATH=$PATH:/home/shengkui.leng/flink/bin

cd $HIVE_HOME
nohup bin/hive --service metastore &

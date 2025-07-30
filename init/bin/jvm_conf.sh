#!/bin/bash
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

if [ $# -ne 1 ];then
    echo "Usage: $(basename "$0") <PID of JVM>"
    exit 1
fi

PID=$1

echo "Heap: -Xms$(jinfo -flag InitialHeapSize $PID | cut -d= -f2) -Xmx$(jinfo -flag MaxHeapSize $PID | cut -d= -f2)"
echo "Metaspace: -XX:MetaspaceSize=$(jinfo -flag MetaspaceSize $PID | cut -d= -f2)"
echo "TLAB: $(jinfo -flag UseTLAB $PID)"

#!/bin/bash
if [ $# -eq 1 ];then
    docker history --format {{.CreatedBy}} --no-trunc=true $1 |sed "s/\/bin\/sh\ -c\ \#(nop)\ //g"|sed "s/\/bin\/sh\ -c/RUN/g" | tac
else
    echo "sh dockerfile.sh $DOCKER\_IMAGE"
fi

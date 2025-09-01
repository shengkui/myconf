#!/bin/bash

cmd_output=`jps | grep -v "Jps"`

declare -a PROCESS_IDS=()
declare -a PROCESS_NAMES=()

#Save PID and Process Name into array.
while read -r line; do
    col1=$(echo "$line" | awk '{print $1}')
    PROCESS_IDS+=("$col1")

    col2=$(echo "$line" | awk '{print $2}')
    PROCESS_NAMES+=("$col2")
done <<< "$cmd_output"

if [[ -z ${PROCESS_NAMES[@]} ]] ;then
    echo "No processes found"
    exit 0
fi
count=${#PROCESS_NAMES[@]}

n=0
for proc_id in "${PROCESS_IDS[@]}" ;do
    echo "=========== ${proc_id} ${PROCESS_NAMES[$n]}"
    jstat -gcutil ${proc_id}

    ((n++))
    if [ $n -ge $count ];then
        n=0
    fi
    echo
done

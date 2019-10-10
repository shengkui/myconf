#!/bin/bash
#Run cppcheck with different checks.
set -o nounset                              # Treat unset variables as an error

TARGET=.
ARG="--enable=warning --force --error-exitcode=1"
if [ $# -ge 1 ];then
    while getopts :as opt ;do
        case $opt in
            a)  ARG="--enable=all --force --error-exitcode=1"
                ;;
            s)  ARG="--enable=style --force --error-exitcode=1"
                ;;
            *)  echo "Usage: $0 [-a] [target]"
                exit 1
                ;;
        esac
    done

    shift $((OPTIND-1))
    if [ $# -ge 1 ];then
        TARGET=$1
    fi
fi

echo "cppcheck $ARG $TARGET"
cppcheck $ARG $TARGET

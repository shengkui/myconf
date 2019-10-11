#!/bin/bash
#Run cppcheck with different checks.
set -o nounset                              # Treat unset variables as an error

print_usage ()
{
    cat <<EOF
=======================================================
    A script to run cppcheck with different checks
                        v1.0
=======================================================

Usage:
    $(basename "$0") [option] [target]

Example:
    $(basename "$0")          ; --enable=warning
    $(basename "$0") -s       ; --enable=style
    $(basename "$0") -a       ; --enable=all
    $(basename "$0") proj     ; check proj/ directory
    $(basename "$0") test.c   ; check specified file

EOF

    exit 1
}

TARGET=.
ARG="--enable=warning --force --error-exitcode=1"
if [ $# -ge 1 ];then
    while getopts :as opt ;do
        case $opt in
            a)  ARG="--enable=all --force --error-exitcode=1"
                ;;
            s)  ARG="--enable=style --force --error-exitcode=1"
                ;;
            *)  print_usage
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

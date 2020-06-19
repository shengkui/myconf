#!/bin/bash
#Run cppcheck with different checks.
set -o nounset                              # Treat unset variables as an error

PNAME=$(basename "$0")
print_usage ()
{
    cat <<EOF
=======================================================
    A script to run cppcheck with different checks
                        v1.1
=======================================================

Usage:
    $PNAME [option] [target]

Example:
    $PNAME          ; --enable=warning
    $PNAME -s       ; --enable=style
    $PNAME -a       ; --enable=all
    $PNAME proj     ; check proj/ directory
    $PNAME test.c   ; check specified file

EOF

    exit 1
}

target=.
arg=(--enable=warning --force --error-exitcode=1)
if [ $# -ge 1 ];then
    while getopts :as opt ;do
        case $opt in
            a)  arg=(--enable=all --force --error-exitcode=1)
                ;;
            s)  arg=(--enable=style --force --error-exitcode=1)
                ;;
            *)  print_usage
                exit 1
                ;;
        esac
    done

    shift $((OPTIND-1))
fi

#If anyother arguments left, get the target directory/file
if [ $# -ge 1 ];then
    target="$1"
fi

echo cppcheck "${arg[@]}" "$target"
cppcheck "${arg[@]}" "$target"

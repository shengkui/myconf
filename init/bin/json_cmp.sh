#!/bin/bash
#===============================================================================
# FILENAME:
#     json_cmp.sh
#
# DESCRIPTION:
#     A script to compare 2 JSON files.
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

if [ $# -ne 2 ] ;then
    echo "Usage: $0 <file1> <file2>"
    exit 1
fi

f1=$1
f2=$2

compare_by_type() {
    case $1 in
        *.json ) diff <(jq . "$1") <(jq . "$2") >&2 ;;
        * )      diff "$1" "$2" >&2 ;;
    esac
    return
}

if ! compare_by_type "$f1" "$f2"; then
    echo "files are different."
    exit 2
else
    echo "files are identical."
    exit 0
fi

#!/bin/bash
#===============================================================================
# FILENAME:
#     search.sh
#
# DESCRIPTION:
#     A script to search string in files with specified file-ext-name under a
#     directory
#     If it's bash v4+, then a simpler command line can be used:
#         $ grep -rnI "$STR" **/*.sh
#     **/*.sh means all the files matching *.sh in the current directory, or in
#     its subdirectories, recursively.
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

if [ $# -lt 2 ] || [ $# -gt 3 ];then
    echo "A script to search string in files with specified file-ext-name under a directory"
    echo "$0 <string> <file ext> [directory]"
    exit 1
fi

STR="$1"
FILE_EXT="$2"
if [ $# -eq 3 ];then
    TDIR="$3"
    grep -rnI --include "$FILE_EXT" "$STR" "$TDIR"
else
    grep -rnI --include "$FILE_EXT" "$STR"
fi

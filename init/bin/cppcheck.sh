#!/bin/bash
set -o nounset                              # Treat unset variables as an error

TARGET=.
if [ $# -eq 1 ];then
    TARGET=$1
fi
OPTION="--enable=style --force --error-exitcode=1 --suppress=nullPointerRedundantCheck --suppress=variableScope --suppress=redundantAssignment"

cppcheck $OPTION $TARGET

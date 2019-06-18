#!/bin/bash
#===============================================================================
# FILENAME:
#     code_check.sh
#
# DESCRIPTION:
#     Run cppcheck or scan-build(clang) for C project.
#
# REVISION(MM/DD/YYYY):
#     12/12/2018  Shengkui Leng (lengshengkui@outlook.com)
#     - Initial version
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

#The directory to check
TARGET=.
if [ $# -eq 1 ];then
    TARGET=$1
fi

#Select code static analyzer:
#   0 - no checker
#   1 - cppcheck
#   2 - clang + scan-build
CHECKER=0
if command -v clang &> /dev/null ;then
    if command -v scan-build &> /dev/null ;then
        CHECKER=2
    fi
fi
if [ $CHECKER -eq 0 ];then
    if command -v cppcheck &> /dev/null;then
        CHECKER=1
    fi
fi

case $CHECKER in
    1)
        echo "======================================"
        echo "Run cppcheck ..."
        echo "======================================"

        OPTION="--enable=warning --force --error-exitcode=1"
        cppcheck $OPTION $TARGET
        ;;

    2)
        echo "======================================"
        echo "Run scan-build ..."
        echo "======================================"

        if [ -d "$TARGET" ];then
            cd "$TARGET" || { echo "invalid $TARGET"; exit 1; }
        fi

        #If it's a cmake project, generate makefile at first
        if [ -s CMakeLists.txt ]; then
            if [ ! -d build ];then
                mkdir build || { echo "mkdir build/ failed!"; exit 1; }
                cd build || { echo "cd build/ failed!"; exit 1; }
            else
                cd build || { echo "cd build/ failed!"; exit 1; }
                make clean
            fi
            scan-build cmake -G "Unix Makefiles" ..
        fi

        OPTION="-enable-checker alpha.core.SizeofPtr --status-bugs -v"
        scan-build $OPTION make -j
        ;;

    *)
        echo "Error: No cppcheck or scan-build(clang) found!"
        exit 2
    ;;
esac

exit $?

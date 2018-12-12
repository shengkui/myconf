#!/bin/bash
#===============================================================================
# FILENAME:
#     code_check.sh
#
# DESCRIPTION:
#     Run cppcheck or scan-build(clang) for C project.
#
# REVISION(MM/DD/YYYY):
#     12/12/2018  Shengkui Leng (shengkui.leng@advantech.com.cn)
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
#   0 - cppcheck
#   1 - clang + scan-build
#   other: no checker
CHECKER=0
if command -v clang &> /dev/null ;then
    if command -v scan-build &> /dev/null ;then
        CHECKER=1
    fi
fi
if [ $CHECKER -eq 0 ];then
    command -v cppcheck &> /dev/null
    if [ $? -ne 0 ];then
        CHECKER=2
    fi
fi

case "$CHECKER" in
    "0")
        OPTION="--enable=warning --force --error-exitcode=1"
        cppcheck $OPTION $TARGET
        ;;

    "1")
        if [ -d "$TARGET" ];then
            cd "$TARGET" || { echo "invalid $TARGET"; exit 1; }
        fi

        #If it's a cmake project, generate makefile at first
        if [ -s CMakeLists.txt ]; then
            if [ ! -d build ];then
                mkdir build
                cd build || { echo "cd build/ failed!"; exit 1; }
                scan-build cmake -G "Unix Makefiles" ..
            else
                cd build || { echo "cd build/ failed!"; exit 1; }
                make clean
            fi
        fi

        OPTION="-enable-checker alpha.core.SizeofPtr --status-bugs -v"
        scan-build $OPTION make -j
        ;;

    *)
        exit 2
    ;;
esac

exit $?

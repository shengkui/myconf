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
target=.
if [ $# -eq 1 ];then
    target=$1
fi

run_cppcheck()
{
    echo "======================================"
    echo "Run cppcheck ..."
    echo "======================================"

    local option=(--enable=warning --force --error-exitcode=1)
    cppcheck "${option[@]}" $target
}

run_scanbuild()
{
    echo "======================================"
    echo "Run scan-build ..."
    echo "======================================"

    if [ -d "$target" ];then
        cd "$target" || { echo "invalid $target"; exit 1; }
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

    local option=(-enable-checker alpha.core.SizeofPtr --status-bugs -v)
    scan-build "${option[@]}" make -j 4
}

#Select code static analyzer:
CHECKER_NONE=0      # 0 - no checker
CHECKER_CPPCHECK=1  # 1 - cppcheck
CHECKER_CLANG=2     # 2 - clang + scan-build

checker=$CHECKER_NONE
if command -v clang &> /dev/null ;then
    if command -v scan-build &> /dev/null ;then
        checker=$CHECKER_CLANG
    fi
fi
if [ $checker -eq $CHECKER_NONE ];then
    if command -v cppcheck &> /dev/null;then
        checker=$CHECKER_CPPCHECK
    fi
fi

case $checker in
    "$CHECKER_CPPCHECK")
        run_cppcheck
        ;;

    "$CHECKER_CLANG")
        run_scanbuild
        ;;

    *)
        echo "Error: No cppcheck or scan-build(clang) found!"
        exit 2
    ;;
esac

exit $?

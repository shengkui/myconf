#!/bin/bash
#===============================================================================
# FILENAME:
#     git_upall.sh
#
# DESCRIPTION:
#     Update all git repositories via "git pull"
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

#Do pull operation for git repo
pull_repo() {
    if [ $# -ne 1 ];then
        echo "invalid parameter"
        return 1
    fi
    local dir=$1

    echo
    echo "-----------------------------------------"
    echo " updating $dir ..."
    echo "-----------------------------------------"
    echo
    cd "$dir" || { echo "Enter dir $dir error"; return 1; }

    git pull 2>&1 || { echo "Update Git repo error"; return 1; }
    if [ -f ".gitmodules" ];then
        git submodule update --init --recursive 2>&1 || \
            { echo "submodule update error"; return 1; }
    fi

    return 0
}

for i in *; do
    #Skip non-directory
    if [[ ! -d "$i" ]];then
        continue
    fi

    #If it's a git repo directory, process it.
    if [[ -d "$i/.git" ]];then
        pushd . > /dev/null || continue
        pull_repo $i
        popd > /dev/null || continue
        continue
    fi

    #Enter sub-directory
    pushd . > /dev/null || continue
    cd "$i" || { echo "enter dir $i error"; continue; }
    for j in *; do
        #If it's a git repo directory, process it.
        if [[ -d "$j" && -d "$j/.git" ]];then
            pushd . > /dev/null || continue
            pull_repo $j
            popd > /dev/null || continue
        fi
    done
    popd > /dev/null || continue
done

exit 0

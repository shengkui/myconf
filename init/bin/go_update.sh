#!/bin/bash
#===============================================================================
# FILENAME:
#     go_update.sh
#
# DESCRIPTION:
#     Update all Go package under a directory via "go get"
#
# REVISION(MM/DD/YYYY):
#     06/18/2019  Shengkui Leng (lengshengkui@outlook.com)
#     - Initial version
#===============================================================================
set -o nounset                  # Treat unset variables as an error
set -o pipefail                 # Prevent errors in a pipeline from being masked

#Update Go package
update_go_package() {
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
    pushd . > /dev/null || return 1

    cd "$dir" || { echo "enter dir $dir error"; return 1; }

    local REMOTE_URL

    #Get URL of git repo and extract the URL of Go package
    REMOTE_URL=$(git remote get-url origin | sed 's#https://##g')
    if [ $? -ne 0 ];then
        echo "get remote url error"
        popd > /dev/null || echo "jump out $dir error"
        return 1
    fi

    #Check the exist of *.go files. Some package is NOT located under the top
    #directory of Git repo.
    if ls ./*.go >/dev/null 2>&1;then
        echo "get $REMOTE_URL"
        go get -u "$REMOTE_URL" 2>&1 || { echo "update package error"; return 1; }
    else
        local subdir
        for subdir in *; do
            if [[ -d "$subdir" ]];then
                if ls "$subdir"/*.go >/dev/null 2>&1 >/dev/null ;then
                    echo "get $REMOTE_URL/$subdir"
                    go get -u "$REMOTE_URL/$subdir" 2>&1 || { echo "update package error"; return 1; }
                    break
                fi
            fi
        done

    fi

    popd > /dev/null || echo "jump out $dir error"
    return 0
}


for i in *; do
    #Skip non-directory
    if [[ ! -d "$i" ]];then
        continue
    fi

    #If it's a git repo directory, process it.
    if [[ -d "$i/.git" ]];then
        update_go_package "$i"
        continue
    fi

    pushd . > /dev/null || continue
    cd "$i" || { echo "enter dir $i error"; continue; }
    for j in *; do
        #If it's a git repo directory, process it.
        if [[ -d "$j" && -d "$j/.git" ]];then
            update_go_package "$j"
        fi
    done
    popd > /dev/null || continue
done

exit 0

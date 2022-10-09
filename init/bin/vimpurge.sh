#!/bin/bash
#
# REF: https://blog.debiania.in.ua/posts/2012-07-31-purging-vim-undodir.html
#
# Purge vim's undodir (:help 'undodir', vim >= 7.3) from fs that does
# not have corresponding files in the filesystem anymore.
#
set -u

if [ $# -ne 1 ] ;then
    undodir="/home/shengkui.leng/.vim/undo"
else
    undodir="$1"
fi

if [ ! -d "$undodir" ] ;then
    echo "Undo directory ($undodir) is NOT exist."
    exit 1
fi

pushd . > /dev/null || { echo "pushd error"; exit 2; }
cd "$undodir" || { echo "enter undodir ($undodir) error"; exit 3; }

for f in * ;do
    #Replace the "%" with "/" to get the real file path.
    src_file_path=$(echo -n "$f" | sed 's#%#/#g')
    if [ ! -e "$src_file_path" ] ;then
        echo "$f"
        rm -f "$f"
    fi
done

popd > /dev/null || { echo "popd error"; exit 3; }

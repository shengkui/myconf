#!/bin/bash
#A script to install useful scripts/tools and vim/git/zsh configurations.

BIN_DIR="bin"
CFG_DIR="git vim zsh"
INST_DIR="/usr/local/bin"
INIT_SCRIPT="init.sh"


pushd . > /dev/null

echo
echo ----------------------------------------------
echo "Installing scripts files ..."
echo ----------------------------------------------
cp -vf "$BIN_DIR/*" "$INST_DIR"


for i in $CFG_DIR; do
    pushd . > /dev/null
    echo
    echo ----------------------------------------------
    echo " Installing $i configuration ..."
    echo ----------------------------------------------

    cd "$i" || { echo "error"; exit 1; }
    $INIT_SCRIPT || { echo "error"; exit 1; }
    popd > /dev/null
done

popd > /dev/null

echo
echo "done"
echo
exit 0

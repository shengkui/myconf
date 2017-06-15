#!/bin/bash
#A script to install useful scripts/tools and vim/git/zsh configurations.

BIN_DIR="bin"               #EXEs to be copied into $INST_DIR
CFG_DIR="git vim zsh"       #Configs for git/vim/shell
INST_DIR="/usr/local/bin"   #Install directory for EXEs
INIT_SCRIPT="init.sh"       #Init script for configs


pushd . > /dev/null

echo
echo ----------------------------------------------
echo "Installing .profile file ..."
echo ----------------------------------------------
cp -vf _profile ${HOME}/.profile || { echo "error"; exit 1; }

echo
echo ----------------------------------------------
echo "Installing scripts files ..."
echo ----------------------------------------------
sudo cp -vf "$BIN_DIR/*" "$INST_DIR" || { echo "error"; exit 1; }

for i in $CFG_DIR; do
    pushd . > /dev/null
    echo
    echo ----------------------------------------------
    echo " Installing $i configuration ..."
    echo ----------------------------------------------

    cd "$i" || { echo "error"; exit 1; }
    ./$INIT_SCRIPT || { echo "install $i error"; exit 1; }
    popd > /dev/null
done

popd > /dev/null

echo
echo "done"
echo
exit 0

#!/bin/bash
#A script to install useful scripts/tools and vim/git/zsh configurations.
#This script shall be run from the init/ directory of myconf

TOP_DIR="$(pwd)"                #init/ directory of myconf
CFG_DIR="git vim zsh go term"   #Configs for git/vim/shell/go/...
INST_DIR="${HOME}/bin"          #Install directory for tools/scripts
INIT_SCRIPT="init.sh"           #Init script for configs
BIN_DIR="${TOP_DIR}/bin"        #Directory of tools/scripts

pushd . > /dev/null || { echo "save PWD error"; exit 1; }

echo
echo ----------------------------------------------
echo "Installing .profile file into HOME ..."
echo ----------------------------------------------
if [ ! -f "${HOME}/.profile" ];then
    ln -sf "${TOP_DIR}/_profile" "${HOME}/.profile" || {
        echo "install profile error"; exit 1; }
fi

#Install tools/scripts files into $HOME/bin
./bin.sh || exit 1

#Enter each sub-directory to run the init script of it
for i in ${CFG_DIR}; do
    pushd . > /dev/null || { echo "save PWD error"; exit 1; }

    echo
    echo ----------------------------------------------
    echo " Installing configuration of $i ..."
    echo ----------------------------------------------

    cd "$i" || { echo "change directory error"; exit 1; }
    ./$INIT_SCRIPT || { echo "install $i error"; exit 1; }

    popd > /dev/null || { echo "restore PWD error"; exit 1; }
done

popd > /dev/null || { echo "restore PWD error"; exit 1; }

echo
echo "done"
echo
exit 0

#!/bin/bash
#A script to install useful scripts/tools and vim/git/zsh configurations.

BIN_DIR="bin"               #EXEs to be copied into $INST_DIR
CFG_DIR="git vim zsh"       #Configs for git/vim/shell
INST_DIR="${HOME}/bin"      #Install directory for EXEs
INIT_SCRIPT="init.sh"       #Init script for configs


pushd . > /dev/null || { echo "save PWD error"; exit 1; }

echo
echo ----------------------------------------------
echo "Installing .profile file ..."
echo ----------------------------------------------
cp -vf _profile "${HOME}"/.profile || { echo "install profile error"; exit 1; }

echo
echo ----------------------------------------------
echo "Installing scripts files ..."
echo ----------------------------------------------
if [ ! -d "${INST_DIR}" ];then
    mkdir -p "${INST_DIR}"
fi
cp -vf "${BIN_DIR}"/* "${INST_DIR}" || { echo "install scripts error"; exit 1; }

for i in ${CFG_DIR}; do
    pushd . > /dev/null || { echo "save PWD error"; exit 1; }

    echo
    echo ----------------------------------------------
    echo " Installing $i configuration ..."
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

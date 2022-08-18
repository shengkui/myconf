#!/bin/bash
#A script to install useful scripts/tools to $HOME/bin.
#This script shall be run from the init/ directory of myconf

TOP_DIR="$(pwd)"            #init/ directory of myconf
INST_DIR="${HOME}/bin"      #Install directory for tools/scripts
BIN_DIR="${TOP_DIR}/bin"    #Directory of tools/scripts

pushd . > /dev/null || { echo "save PWD error"; exit 1; }

echo
echo ----------------------------------------------
echo "Installing tools/scripts files into HOME/bin ..."
echo ----------------------------------------------
if [ ! -d "${INST_DIR}" ];then
    mkdir -p "${INST_DIR}"
fi
#Create symbolic link from every script
for file in "${BIN_DIR}"/* ;do
    name=$(basename "$file")    #Get the file name without path
    if [ ! -f "${INST_DIR}/${name}" ];then
        ln -sf "${file}" "${INST_DIR}" || { echo "install script ${name} error"; exit 1; }
    fi
done


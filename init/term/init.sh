#!/bin/bash

SCREEN_CFG="${HOME}/.screenrc"
INIT_DIR="$(pwd)"            #directory of myconf/term

#Install .screenc
if [ ! -f "${SCREEN_CFG}" ];then
    echo "Installing .screenrc ..."
    ln -sf "${INIT_DIR}/_screenrc" "${SCREEN_CFG}" || { echo "install .screenrc error"; exit 1; }
fi

exit 0

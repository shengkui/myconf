#!/bin/bash

GOLANGCI_CFG="${HOME}/.golangci.yml"
INIT_DIR="$(pwd)"            #directory of myconf/other

#Golangci-linter config file .golangci.yml
if [ ! -f "${GOLANGCI_CFG}" ];then
    echo "Installing .golangci.yaml ..."
    ln -sf "${INIT_DIR}/_golangci.yml" "${GOLANGCI_CFG}" || \
        { echo "install .golangci.yml error"; exit 1; }
fi

./gitea_token.sh

exit 0

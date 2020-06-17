#!/bin/bash

GOLANGCI_CFG="${HOME}/.golangci.yml"
INIT_DIR="$(pwd)"            #directory of myconf/other

#Golangci-linter config file .golangci.yml
if [ ! -f "${GOLANGCI_CFG}" ];then
    echo "Installing .golangci.yaml ..."
    ln -sf "${INIT_DIR}/_golangci.yml" "${GOLANGCI_CFG}" || \
        { echo "install .golangci.yml error"; exit 1; }
fi

#Install tools for Go
export CGO_DISABLE=1
export GO111MODULE=on

GO_GET="go get"
$GO_GET golang.org/x/tools/gopls@latest
$GO_GET golang.org/x/tools/cmd/goimports@latest
$GO_GET github.com/golangci/golangci-lint

./gitea_token.sh

exit 0

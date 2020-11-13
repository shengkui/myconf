#!/bin/bash

GOLANGCI_CFG="${HOME}/.golangci.yml"
INIT_DIR="$(pwd)"            #directory of myconf/go

#Golangci-linter config file .golangci.yml
if [ ! -f "${GOLANGCI_CFG}" ];then
    echo "Installing .golangci.yaml ..."
    ln -sf "${INIT_DIR}/_golangci.yml" "${GOLANGCI_CFG}" || \
        { echo "install .golangci.yml error"; exit 1; }
fi

#Install tools for Go
export CGO_DISABLE=1
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct

GO_GET="go get"
$GO_GET golang.org/x/tools/gopls@latest
$GO_GET golang.org/x/tools/cmd/goimports@latest
$GO_GET github.com/golangci/golangci-lint/cmd/golangci-lint@latest

exit 0

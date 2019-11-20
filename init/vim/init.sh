#!/bin/bash

VIM_DIR="${HOME}/.vim"
VIM_CFG="${HOME}/.vimrc"
INIT_DIR="$(pwd)"            #directory of myconf/vim

#Create directories
if [ -d "${VIM_DIR}" ];then
    rm -rf "${VIM_DIR}"
fi
mkdir -p "${VIM_DIR}"/{plugged,undo} ||
    { echo "create .vim dir error"; exit 1; }

#Install UltiSnips
if [ -d "${VIM_DIR}/UltiSnips" ];then
    echo "UltiSnips is already exist, skip it"
else
    ln -sf "${INIT_DIR}/UltiSnips" "${VIM_DIR}/" || { echo "install UltiSnips error"; exit 1; }
fi

#Install .vimrc
if [ -f "${VIM_CFG}" ];then
    echo ".vimrc is already exist, skip it"
else
    ln -sf "${INIT_DIR}/_vimrc" "${VIM_CFG}" || { echo "install .vimrc error"; exit 1; }
fi

#Install vim-plug
curl -fLo "${VIM_DIR}"/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    || { echo "install vim-plug error"; exit 1; }

#Install vim lsp server for Go
go get -u github.com/sourcegraph/go-langserver ||
    { echo "install lsp server for go error"; exit 1; }

exit 0

#!/bin/bash

VIM_DIR="${HOME}/.vim"
VIM_CFG="${HOME}/.vimrc"

if [ -d "${VIM_DIR}" ];then
    rm -rf "${VIM_DIR}"
fi
mkdir -p "${VIM_DIR}"/{bundle,tags,undo} ||
    { echo "create .vim dir error"; exit 1; }

cp -avf UltiSnips "${VIM_DIR}" || { echo "copy UltiSnips error"; exit 1; }
cp -vf _vimrc "${VIM_CFG}" || { echo "copy .vimrc error"; exit 1; }

#Install vim-plug
curl -fLo "${VIM_DIR}"/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    || { echo "install vim-plug error"; exit 1; }

#Install vim lsp server for Go
go get -u github.com/sourcegraph/go-langserver ||
    { echo "install lsp server for go error"; exit 1; }

#!/bin/bash

VIM_DIR="${HOME}/.vim"
VIM_CFG="${HOME}/.vimrc"
VIM_PLUG="${VIM_DIR}/autoload/plug.vim"
INIT_DIR="$(pwd)"            #directory of myconf/vim

#Create directories
mkdir -p "${VIM_DIR}"/{plugged,undo} ||
    { echo "create .vim dir error"; exit 1; }

#Install UltiSnips
if [ ! -d "${VIM_DIR}/UltiSnips" ];then
    echo "Installing UltiSnips ..."
    ln -sf "${INIT_DIR}/UltiSnips" "${VIM_DIR}/" || { echo "install UltiSnips error"; exit 1; }
fi

#Install .vimrc
if [ ! -f "${VIM_CFG}" ];then
    echo "Installing .vimrc ..."
    ln -sf "${INIT_DIR}/_vimrc" "${VIM_CFG}" || { echo "install .vimrc error"; exit 1; }
fi

#Install vim-plug
if [ ! -f "${VIM_PLUG}" ];then
    echo "Installing vim-plug ..."
    curl -fLo "${VIM_PLUG}" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
        || { echo "install vim-plug error"; exit 1; }
fi

#Install vim lsp server for Go
echo "Installing go-langserver ..."
go get -u github.com/sourcegraph/go-langserver ||
    { echo "install lsp server for go error"; exit 1; }

exit 0

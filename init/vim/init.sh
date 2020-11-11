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

#Install lsp for javascript/typescript
if command -v npm &> /dev/null ;then
    npm install -g typescript typescript-language-server
fi

exit 0

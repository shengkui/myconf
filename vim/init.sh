#!/bin/bash

VIM_DIR="${HOME}/.vim"

mkdir -p "${VIM_DIR}"/{bundle,tags,undo}
cp -a UltiSnips "${VIM_DIR}"
cp _vimrc "${HOME}"/.vimrc
#git clone https://github.com/VundleVim/Vundle.vim.git "${VIM_DIR}"/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

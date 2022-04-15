#!/bin/bash

OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"
ZSH_CFG="${HOME}/.zshrc"
ZJUMP_DIR="${OH_MY_ZSH_DIR}"/custom/plugins/zjump
FORGIT_DIR="${OH_MY_ZSH_DIR}"/custom/plugins/forgit
FZF_DIR="${HOME}"/.fzf
INIT_DIR="$(pwd)"            #directory of myconf/zsh

if [ ! -d "${OH_MY_ZSH_DIR}" ];then
    # Download install script and run it.
    echo "Installing oh-my-zsh ..."
    #sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    git clone https://github.com/ohmyzsh/ohmyzsh.git "${OH_MY_ZSH_DIR}" \
        || { echo "download oh-my-zsh error"; exit 1; }
fi

#Install my zsh config file
if [ ! -f "${ZSH_CFG}" ];then
    echo "Installing .zshrc ..."
    ln -sf "${INIT_DIR}/_zshrc" "${ZSH_CFG}" || { echo "install .zshrc error"; exit 1; }
fi

# Install zjump plugin
if [ ! -d "${ZJUMP_DIR}" ];then
    git clone https://github.com/qoomon/zjump "${ZJUMP_DIR}"
fi

# Install forgit plugin
if [ ! -d "${FORGIT_DIR}" ];then
    git clone https://github.com/wfxr/forgit.git "${FORGIT_DIR}"
fi

# Install fzf(needed by ZSH zjump plugin)
if ! command -v fzf &> /dev/null ;then
    echo "Installing fzf ..."
    git clone --depth 1 https://github.com/junegunn/fzf.git "${FZF_DIR}"
    "${FZF_DIR}"/install --bin
    sudo ln -sf "${FZF_DIR}"/bin/fzf /usr/local/bin/fzf
fi

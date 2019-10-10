#!/bin/bash

OH_MY_ZSH_DIR="${HOME}/.oh-my-zsh"
ZSH_CFG="${HOME}/.zshrc"
ZJUMP_DIR="${OH_MY_ZSH_DIR}"/custom/plugins/zjump
FZF_DIR="${HOME}"/.fzf

if [ -d "${OH_MY_ZSH_DIR}" ];then
    rm -rf "${OH_MY_ZSH_DIR}"
fi

# Download install script and run it.
#sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone git://github.com/robbyrussell/oh-my-zsh.git "${OH_MY_ZSH_DIR}" \
    || { echo "download oh-my-zsh error"; exit 1; }

# Copy my zsh config file.
cp _zshrc "${ZSH_CFG}" || { echo "copy .zshrc error"; exit 1; }

# Install zjump plugin
git clone https://github.com/qoomon/zjump "${ZJUMP_DIR}"

# Install fzf(needed by ZSH zjump plugin)
git clone --depth 1 https://github.com/junegunn/fzf.git "${FZF_DIR}"
"${FZF_DIR}"/install --bin
sudo ln -sf "${FZF_DIR}"/bin/fzf /usr/local/bin/fzf

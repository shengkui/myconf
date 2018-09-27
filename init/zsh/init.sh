#!/bin/bash

# Download install script and run it.
#sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone git://github.com/robbyrussell/oh-my-zsh.git "${HOME}"/.oh-my-zsh \
    || { echo "download oh-my-zsh error"; exit 1; }

# Copy my zsh config file.
cp _zshrc "${HOME}"/.zshrc || { echo "copy .zshrc error"; exit 1; }

# Install zjump plugin
git clone https://github.com/qoomon/zjump "${HOME}"/.oh-my-zsh/custom/plugins/zjump

# Install fzf(needed by ZSH zjump plugin)
git clone --depth 1 https://github.com/junegunn/fzf.git "${HOME}"/.fzf
"${HOME}"/.fzf/install --bin
sudo ln -s "${HOME}"/.fzf/bin/fzf /usr/local/bin/fzf

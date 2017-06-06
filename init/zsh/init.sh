#!/bin/bash

# Download install script and run it.
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Copy my zsh config file.
cp _zshrc "${HOME}"/.zshrc || { echo "copy .zshrc error"; exit 1; }

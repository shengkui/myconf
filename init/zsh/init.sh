#!/bin/bash

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp _zshrc "${HOME}"/.zshrc

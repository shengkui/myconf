#!/bin/sh
#Set all typical git configuration.

#User information
git config --global user.name "shengkui.leng"
git config --global user.email shengkui.leng@advantech.com.cn

git config --global push.default simple

#Format of date&time
git config --global log.date iso

#Don't convert CR/LF chars
git config --global core.autocrlf false
git config --global core.safecrlf true

#Editor for commit
git config --global core.editor vim

#Enable color
git config --global color.ui true

#Alias
git config --global alias.st "status"
git config --global alias.ci "commit"
git config --global alias.co "checkout"
git config --global alias.br "branch"

git config --global alias.last "log -1 HEAD"
git config --global alias.ls "log --oneline --abbrev-commit --graph --decorate"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.ll 'log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate --numstat'

git config --global alias.df "diff --ignore-space-at-eol"

#config for tig
echo "set ignore-space = at-eol" >> "${HOME}"/.tigrc

exit 0

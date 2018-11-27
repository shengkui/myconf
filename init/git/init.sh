#!/bin/sh
#Set all typical git configuration.

GIT_CFG="git config --global"

#User information
$GIT_CFG user.name "shengkui.leng"
$GIT_CFG user.email shengkui.leng@advantech.com.cn

$GIT_CFG push.default simple

#Format of date&time
$GIT_CFG log.date format-local:"%Y-%m-%d %H:%M:%S"
$GIT_CFG blame.date format-local:"%Y-%m-%d %H:%M:%S"

#Don't convert CR/LF chars
$GIT_CFG core.autocrlf false
$GIT_CFG core.safecrlf true

#Editor for commit
$GIT_CFG core.editor vim

#Enable color
$GIT_CFG color.ui true

#Alias
$GIT_CFG alias.st "status"
$GIT_CFG alias.ci "commit"
$GIT_CFG alias.co "checkout"
$GIT_CFG alias.br "branch"

$GIT_CFG alias.last "log -1 HEAD"
$GIT_CFG alias.ls "log --oneline --abbrev-commit --graph --decorate"
$GIT_CFG alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
$GIT_CFG alias.ll 'log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate --numstat'

$GIT_CFG alias.df "diff --ignore-space-at-eol"

#config for tig
echo "set ignore-space = at-eol" > "${HOME}"/.tigrc
echo "set main-view-date-local = true" >> "${HOME}"/.tigrc
echo "set blame-view-date-local = true" >> "${HOME}"/.tigrc

exit 0

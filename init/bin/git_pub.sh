#!/bin/sh
# Set user account for public git service: github.com, git.oschina.net,
# code.csdn.net, ...
GIT_CFG="git config --local"

#name and mail
$GIT_CFG user.name "Shengkui Leng"
$GIT_CFG user.email lengshengkui@outlook.com

#cache password for 1hour
$GIT_CFG credential.helper 'cache --timeout=3600'

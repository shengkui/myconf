#!/bin/sh
# Set user account for public git service: github.com, git.oschina.net,
# code.csdn.net, ...

#name and mail
git config --local user.name "Shengkui Leng"
git config --local user.email lengshengkui@outlook.com

#cache password for 15min
git config --local credential.helper cache
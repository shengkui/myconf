#!/bin/bash
#Set all typical git configuration.

INIT_DIR="$(pwd)"            #directory of myconf/git
GIT_CFG="git config --global"

#gitconfig
echo "Installing .gitconfig ..."
cp -f "${INIT_DIR}/_gitconfig" "${HOME}/.gitconfig" || { echo "install .gitconfig error"; exit 1; }

#user files
GITUSER_DEFAULT=${HOME}/.gituser-default
if [ ! -f "${GITUSER_DEFAULT}" ];then
    echo "Installing .gituser-default ..."
    ln -sf "${INIT_DIR}/_gituser-default" "${GITUSER_DEFAULT}" || { echo "install .gituser-default error"; exit 1; }
fi
GITUSER_PUBLIC=${HOME}/.gituser-public
if [ ! -f "${GITUSER_PUBLIC}" ];then
    echo "Installing .gituser-public ..."
    ln -sf "${INIT_DIR}/_gituser-public" "${GITUSER_PUBLIC}" || { echo "install .gituser-public error"; exit 1; }
fi

#gitmessage
GIT_MESSAGE=${HOME}/.gitmessage
$GIT_CFG commit.template "${GIT_MESSAGE}"
if [ ! -f "${GIT_MESSAGE}" ];then
    echo "Installing .gitmessage ..."
    ln -sf "${INIT_DIR}/_gitmessage" "${GIT_MESSAGE}" || { echo "install .gitmessage error"; exit 1; }
fi

#Global ignore
GIT_IGNORE=${HOME}/.gitignore
$GIT_CFG core.excludesfile "${GIT_IGNORE}"
if [ ! -f "${GIT_IGNORE}" ];then
    echo "Installing .gitignore ..."
    ln -sf "${INIT_DIR}/_gitignore" "${GIT_IGNORE}" || { echo "install .gitignore error"; exit 1; }
fi

#editorconfig
EDITORCONFIG=${HOME}/.editorconfig
if [ ! -f "${EDITORCONFIG}" ];then
    echo "Installing .editorconfig ..."
    ln -sf "${INIT_DIR}/_editorconfig" "${EDITORCONFIG}" || { echo "install .editorconfig error"; exit 1; }
fi

#config for tig
TIGRC=${HOME}/.tigrc
if [ ! -f "${TIGRC}" ];then
    echo "Installing .tigrc ..."
    ln -sf "${INIT_DIR}/_tigrc" "${TIGRC}" || { echo "install .tigrc error"; exit 1; }
fi

#git-subrepo
if [ ! -d "${HOME}"/.subrepo ];then
    echo "Installing git-subrepo ..."
    git clone https://github.com/ingydotnet/git-subrepo "${HOME}"/.subrepo || {
        echo "Install git-surepo error"; exit 1; }
fi

exit 0

#My config file

This repo includes some config files and scripts for Linux os, git, vim and zsh.

    init/
     ├── install.sh     #An install script
     ├── _profile       #Profile for bash
     ├── bin/           #Scripts installed to /usr/local/bin
     ├── git/           #Config for git
     ├── os/            #Scripts to install required software packages
     ├── vim/           #Config for vim
     └── zsh/           #Config for zsh

##Usage

There is an install script under init/ folder. Just run it!

##NOTES

1. Before running install.sh, please make sure all necessary packages have been
   installed already. The scripts under init/os/ folder could be a good start.

2. The install.sh will ask for sudo password during installation. It's needed to
   copy scripts to /usr/local/bin/.

3. After running the install.sh script, please open vim and run command
   :PlugInstall to install all vim plugins.

4. If you want to re-run the install script, please remove all installed files
   at first.

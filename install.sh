#!/usr/bin/env bash

git pull
git submodule init
git submodule update --recursive

function vimOnly() {
	rsync --exclude ".gitmodules" --exclude ".git/" --exclude ".bash_aliases" --exclude ".bashrc" --exclude "install.sh" --exclude "README.md" --exclude ".gitconfig" --exclude ".gitignore_global" --exclude "powerline-bash/" --exclude ".fonts/" -av . ~
}

function fontsOnly() {
	rsync --exclude ".gitmodules" --exclude ".git/" --exclude ".bash_aliases" --exclude ".bashrc" --exclude "install.sh" --exclude "README.md" --exclude ".gitconfig" --exclude ".gitignore_global" --exclude ".vimrc" --exclude ".vim/" --exclude "powerline-bash/" -av . ~
}

function bashOnly() {
	rsync --exclude ".gitmodules" --exclude ".git/" --exclude "install.sh" --exclude "README.md" --exclude ".gitconfig" --exclude ".gitignore_global" --exclude ".vimrc" --exclude ".vim/" --exclude ".fonts/" -av . ~
}

function doIt() {
	rsync --exclude ".gitmodules" --exclude ".git/" --exclude "install.sh" --exclude "README.md" -av . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
elif [ "$1" == "vim" ]; then
    vimOnly
elif [ "$1" == "bash" ]; then
    bashOnly
elif [ "$1" == "fonts" ]; then
    fontsOnly
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi

#!/usr/bin/env bash

git pull
git submodule init
git submodule update --recursive

function doIt() {
	rsync --exclude ".gitmodules" --exclude ".gitconfig" --exclude ".git/" --exclude "install.sh" --exclude "README.md" -av . ~
}

function doItMac() {
	rsync --exclude ".gitmodules" --exclude ".gitconfig" --exclude ".git/" --exclude "install.sh" --exclude "README.md" --exclude ".config/" --exclude ".fonts/" --exclude ".i3/" --exclude ".i3status.conf" -av . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
elif [ "$1" == "--mac" ]; then
    doItMac
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi

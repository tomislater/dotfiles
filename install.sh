#!/usr/bin/env bash

git pull
git submodule init
git submodule update --recursive

function vimOnly() {
	rsync --exclude ".gitmodules" --exclude ".gitconfig" --exclude ".git-completion.bash" --exclude ".git/" --exclude ".bash_aliases" --exclude ".bashrc" --exclude "install.sh" --exclude "README.md" --exclude ".gitconfig" --exclude ".gitignore_global" --exclude "powerline-shell/" --exclude ".fonts/" --exclude ".config/" --exclude ".i3status.conf" -av . ~
}

function fontsOnly() {
	rsync --exclude ".gitmodules" --exclude ".gitconfig" --exclude ".git-completion.bash" --exclude ".git/" --exclude ".bash_aliases" --exclude ".bashrc" --exclude "install.sh" --exclude "README.md" --exclude ".gitconfig" --exclude ".gitignore_global" --exclude ".vimrc" --exclude ".vim/" --exclude "powerline-shell/" --exclude "powerline/" --exclude ".config/" --exclude ".i3status.conf" -av . ~
}

function bashOnly() {
	rsync --exclude ".gitmodules" --exclude ".gitconfig" --exclude ".git/" --exclude "install.sh" --exclude "README.md" --exclude ".gitconfig" --exclude ".gitignore_global" --exclude ".vimrc" --exclude ".vim/" --exclude ".fonts/" --exclude ".i3status.conf" -av . ~
}

function sublimeOnly() {
	rsync --exclude ".gitmodules" --exclude ".gitconfig" --exclude ".git-completion.bash" --exclude ".git/" --exclude ".bash_aliases" --exclude ".bashrc" --exclude "install.sh" --exclude "README.md" --exclude ".gitconfig" --exclude ".gitignore_global" --exclude "powerline-shell/" --exclude ".fonts/" --exclude ".config/terminator/" --exclude ".i3status.conf" -av . ~
}

function i3() {
	rsync --exclude ".gitmodules" --exclude ".gitconfig" --exclude ".git-completion.bash" --exclude ".git/" --exclude ".bash_aliases" --exclude ".bashrc" --exclude "install.sh" --exclude "README.md" --exclude ".gitconfig" --exclude ".gitignore_global" --exclude "powerline-shell/" --exclude ".fonts/" --exclude ".config/terminator/" --exclude ".config/sublime-text-2/" -av . ~
}

function doIt() {
	rsync --exclude ".gitmodules" --exclude ".gitconfig" --exclude ".git/" --exclude "install.sh" --exclude "README.md" -av . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
elif [ "$1" == "vim" ]; then
    vimOnly
elif [ "$1" == "bash" ]; then
    bashOnly
elif [ "$1" == "fonts" ]; then
    fontsOnly
elif [ "$1" == "sublime" ]; then
    sublimeOnly
elif [ "$1" == "i3" ]; then
    i3
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi

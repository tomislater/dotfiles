dotfiles
========

Install
-------
###### Fonts + Vim + Bash
    ./install.sh # (-f, --force)

###### Only Vim
    ./install.sh vim

###### Only Bash
    ./install.sh bash

###### Only Fonts
    ./install.sh fonts

Useful things
-------------

###### Packages
    sudo apt-get install ack-grep vim-gnome

###### Solarized (dark) for gnome-terminal from https://gist.github.com/1280177
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_background" --type bool false
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/use_theme_colors" --type bool false
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/palette" --type string "#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#00002B2B3636"
    gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#65657B7B8383"

###### Links to plugins
    https://github.com/mileszs/ack.vim.git
    https://github.com/kien/ctrlp.vim.git
    https://github.com/scrooloose/nerdcommenter.git
    https://github.com/scrooloose/nerdtree.git
    https://github.com/klen/python-mode.git
    https://github.com/altercation/vim-colors-solarized.git
    https://github.com/Lokaltog/powerline.git
    https://github.com/mattn/zencoding-vim
    https://github.com/plasticboy/vim-markdown

###### Powerline-bash
    https://github.com/milkbikis/powerline-bash.git

###### Powerline
    https://github.com/Lokaltog/powerline.git

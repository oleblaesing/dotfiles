#!/usr/bin/zsh
sudo pacman -Syu
git -C ~/Code/dotfiles pull
source ~/.zshrc
upgrade_oh_my_zsh

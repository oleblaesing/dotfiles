#!/usr/local/bin/zsh
git -C ~/Code/dotfiles pull
source ~/.zshrc
brew update && brew upgrade
upgrade_oh_my_zsh
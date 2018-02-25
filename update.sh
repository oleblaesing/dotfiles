#!/usr/local/bin/zsh
brew update && brew upgrade
brew cleanup
upgrade_oh_my_zsh
git -C ~/Code/dotfiles pull
source ~/.zshrc

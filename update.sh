#!/usr/local/bin/zsh
brew update && brew upgrade
brew cask upgrade
brew cleanup
git -C ~/Code/dotfiles pull
source ~/.zshrc
upgrade_oh_my_zsh

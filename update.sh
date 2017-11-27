#!/usr/local/bin/zsh
git -C ~/Code/dotfiles pull
source ~/.zshrc

if [[ $(uname -a) == Darwin* ]]; then
  brew update && brew upgrade
else
  sudo apt-get update && sudo apt-get upgrade
fi

upgrade_oh_my_zsh

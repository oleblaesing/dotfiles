# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings and remove packages

sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoremove
sudo apt install curl zsh neovim git keepassxc firefox docker libreoffice vlc ssh wget htop zip ghc

# Restore backup files

ln -sf ~/Keys/ssh ~/.ssh
ssh-add ~/.ssh/oleblaesing@fastmail.com

mkdir ~/Repositories
cd ~/Repositories
git clone git@github.com:oleblaesing/dotfiles.git

ln -sf ~/Repositories/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/Repositories/dotfiles/zsh/themes/macos.zsh-theme ~/.oh-my-zsh/themes/macos.zsh-theme
mkdir -p ~/.config/nvim
ln -s ~/Repositories/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/Repositories/dotfiles/git/.gitconfig ~/.gitconfig

chsh -s /usr/local/bin/zsh
zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall

cd ~/.themes
git clone git@github.com:oleblaesing/Ant-Dracula.git
```

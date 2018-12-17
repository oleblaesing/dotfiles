# Dotfiles

Personal dotfiles, scripts and guides

![Screenshot](screenshot.png "Screenshot")

## Installation

Go through system settings and restore backup files

```sh
sudo dnf update
sudo dnf install curl zsh neovim git gpg
sudo dnf install keepassxc firefox thunderbird spotify
sudo dnf install docker chromium google-chrome libreoffice

chsh -s /usr/local/bin/zsh
zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ~/Keys/ssh ~/.ssh
ssh-add ~/.ssh/ole.blaesing@web.de

mkdir ~/Repositories
~/Repositories
git clone https://github.com/oleblaesing/dotfiles.git

ln -sf ~/Repositories/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/Repositories/dotfiles/zsh/themes/macos.zsh-theme ~/.oh-my-zsh/themes/macos.zsh-theme
ln -s ~/Repositories/dotfiles/git/.gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim
ln -s ~/Repositories/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/Repositories/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/Repositories/dotfiles/vscode/keybindings.json ~/.config/User/keybindings.json

source ~/.zshrc

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
```

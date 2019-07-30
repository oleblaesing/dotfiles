# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings and remove packages

sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoremove
sudo apt install curl zsh neovim git gpg keepassxc firefox thunderbird spotify docker libreoffice vlc ssh wget htop nodejs ghc zip devilspie2
curl https://sh.rustup.rs -sSf | sh

mkdir .themes
cd .themes
wget https://www.gnome-look.org/p/1099856/startdownload?file_id=1559925485&file_name=Ant-Dracula.tar&file_type=application/x-xz&file_size=367844
tar -xf Ant-Dracula.tar
gsettings set org.gnome.desktop.interface gtk-theme Ant-Dracula
gsettings set org.gnome.desktop.wm.preferences theme Ant-Dracula

cd ~/Pictures
wget https://github.com/oleblaesing/dotfiles/raw/master/wallpaper.png

# Set background wallpaper and restore backup files

ln -sf ~/Keys/ssh ~/.ssh
ssh-add ~/.ssh/ole.blaesing@web.de

mkdir ~/Repositories
cd ~/Repositories
git clone git@github.com:oleblaesing/dotfiles.git

ln -sf ~/Repositories/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/Repositories/dotfiles/zsh/themes/macos.zsh-theme ~/.oh-my-zsh/themes/macos.zsh-theme
ln -s ~/Repositories/dotfiles/tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/nvim
ln -s ~/Repositories/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/Repositories/dotfiles/git/.gitconfig ~/.gitconfig
mkdir -p ~/.config/devilspie2
mkdir -p ~/.config/systemd/user
ln -s ~/Repositories/dotfiles/devilspie2/devilspie2.lua ~/.config/devilspie2/devilspie2.lua
ln -s ~/Repositories/dotfiles/devilspie2/devilspie2.service ~/.config/systemd/user/devilspie2.service
systemctl --user enable devilspie2.service
systemctl --user start devilspie2.service

chsh -s /usr/local/bin/zsh
zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
source ~/.zshrc

tmux

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
```

# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoremove
sudo apt install zsh \
  zip \
  htop \
  curl \
  wget \
  ssh \
  git \
  neovim \
  keepassxc \
  firefox \
  docker \
  libreoffice \
  vlc \
  nodejs \
  haskell-platform

curl https://sh.rustup.rs -sSf | sh

# Restore backup files

ln -sf ~/Keys/ssh ~/.ssh
ssh-add ~/.ssh/oleblaesing@fastmail.com

mkdir ~/Repositories
cd ~/Repositories
git clone https://github.com/EliverLara/Ant-Dracula.git
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
git clone git@github.com:oleblaesing/dotfiles.git
git clone https://github.com/dracula/zsh.git zsh-theme-dracula

mkdir -p ~/.themes
ln -s ~/Repositories/Ant-Dracula ~/.themes/Ant-Dracula
gsettings set org.gnome.desktop.interface gtk-theme "Ant-Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Ant-Dracula"

# Select grey color as wallpaper

cd gnome-terminal-colors-dracula
./install.sh
cd -

ln -sf ~/Repositories/dotfiles/.zshrc ~/.zshrc
ln -s ~/Repositories/zsh-theme-dracula/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
chsh -s /usr/local/bin/zsh
zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
source ~/.zshrc

ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
ln -s ~/Repositories/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
```

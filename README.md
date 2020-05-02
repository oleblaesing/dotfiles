# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo dnf remove cheese gnome-boxes gnome-contacts gnome-maps gnome-photos gnome-weather rhythmbox totem

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf upgrade
sudo dnf install zsh \
  zip \
  htop \
  curl \
  wget \
  openssh \
  git \
  neovim \
  keepassxc \
  firefox \
  openvpn \
  transmission \
  libreoffice \
  vlc \
  nodejs \
  haskell-platform

curl https://sh.rustup.rs -sSf | sh

wget https://github.com/VSCodium/vscodium/releases/download/1.40.1/codium-1.40.1-1573814927.el7.x86_64.rpm
sudo dnf install codium-1.40.1-1573814927.el7.x86_64.rpm
rm codium-1.40.1-1573814927.el7.x86_64.rpm

# Restore backup files

ln -s ~/Keys/ssh ~/.ssh
chmod -R 700 ~/.ssh
chmod 644 ~/.ssh/*.pub
chmod 600 ~/.ssh/*(?!.pub)
ssh-add ~/.ssh/oleblaesing@fastmail.com

mkdir ~/Repositories
cd ~/Repositories
git clone https://github.com/EliverLara/Ant-Dracula.git
git clone git@gitlab.com:oleblaesing/dotfiles.git
git clone https://github.com/dracula/zsh.git zsh-theme-dracula

mkdir -p ~/.themes
ln -s ~/Repositories/Ant-Dracula ~/.themes/Ant-Dracula
gsettings set org.gnome.desktop.interface gtk-theme "Ant-Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Ant-Dracula"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/Repositories/zsh-theme-dracula/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -sf ~/Repositories/dotfiles/.zshrc ~/.zshrc
chsh -s /usr/local/zsh

ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
ln -s ~/Repositories/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall

ln -s ~/Repositories/dotfiles/.config/VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/keybindings.json ~/.config/VSCodium/User/keybindings.json
```

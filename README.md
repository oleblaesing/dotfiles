# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo dnf remove cheese gnome-boxes gnome-contacts gnome-maps gnome-photos gnome-weather rhythmbox totem

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.com/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf upgrade --refresh
sudo dnf install \
  codium \
  curl \
  discord \
  electrum \
  firefox \
  gimp \
  git \
  keepassxc \
  libreoffice \
  lutris \
  neovim \
  nodejs \
  openssh \
  podman \
  VirtualBox \
  vlc \
  wget \
  xclip \
  xdg-open \
  zip \
  zsh

# Install Spotify

# Restore backup files
ln -s ~/Keys/ssh ~/.ssh
chmod -R 700 ~/.ssh
chmod 644 ~/.ssh/*
chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

ln -s ~/Documents/electrum.wallet ~/.electrum/wallets/default_wallet

mkdir ~/Repositories
cd ~/Repositories
git clone git@gitlab.com:oleblaesing/dotfiles.git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -s ~/Repositories/dotfiles/.zshrc ~/.zshrc
chsh -s /usr/local/zsh

ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
ln -s ~/Repositories/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall

ln -s ~/Repositories/dotfiles/.config/VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/keybindings.json ~/.config/VSCodium/User/keybindings.json

# Install themes from https://draculatheme.com/
```

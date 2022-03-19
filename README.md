# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo dnf remove cheese gnome-boxes gnome-contacts gnome-maps gnome-photos gnome-weather rhythmbox totem

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf upgrade --refresh
sudo dnf install \
  curl \
  exa \
  fzf \
  git \
  neovim \
  nodejs \
  openssh \
  podman \
  procs \
  ripgrep \
  VirtualBox \
  wget \
  xclip \
  xdg-open \
  zip \
  zsh

flatpak install discord # Add `--no-sandbox` to .desktop file in `/var/lib/flatpak/app/com.discordapp.Discord/current/active/export/share/applications/com.discordapp.Discord.desktop`
flatpak install electrum
flatpak install keepassxc
flatpak install libreoffice
flatpak install librewolf
flatpak install spotify
flatpak install vlc
flatpak install vscodium

# Restore backup files
ln -s ~/Keys/ssh ~/.ssh
chmod -R 700 ~/.ssh
chmod 644 ~/.ssh/*
chmod 600 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa

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

ln -s ~/Repositories/dotfiles/.config/VSCodium/User/settings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/settings.json
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/keybindings.json ~/.var/app/com.vscodium.codium/config/VSCodium/User/keybindings.json

# Install themes from https://draculatheme.com/
```

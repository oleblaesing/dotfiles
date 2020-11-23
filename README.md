# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo dnf remove cheese gnome-boxes gnome-contacts gnome-maps gnome-photos gnome-weather rhythmbox totem

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install -y dnf-plugins-core distribution-gpg-keys

sudo dnf copr enable taw/element

sudo rpm --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=gitlab.com_paulcarroty_vscodium_repo\nbaseurl=https://paulcarroty.gitlab.com/vscodium-deb-rpm-repo/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg" |sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf upgrade --refresh
sudo dnf install \
  chromium-browser-privacy
  codium \
  curl \
  electrum \
  element \
  ffmpeg \
  firefox \
  git \
  htop \
  id3v2 \
  ImageMagick \
  keepassxc \
  libreoffice \
  lutris \
  neovim \
  nodejs \
  openssh \
  openvpn \
  podman \
  transmission \
  vlc \
  wget \
  xclip \
  xdg-open \
  youtube-dl \
  zip \
  zsh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Restore backup files
ln -s ~/Keys/ssh ~/.ssh
chmod -R 700 ~/.ssh
chmod 644 ~/.ssh/*.pub
chmod 600 ~/.ssh/*(?!.pub)
ssh-add ~/.ssh/oleblaesing@fastmail.com

ln -s ~/Documents/electrum.wallet ~/.electrum/wallets/default_wallet

mkdir ~/Repositories
cd ~/Repositories
git clone git@gitlab.com:oleblaesing/dotfiles.git

mkdir -p ~/.themes
git clone https://github.com/EliverLara/Ant-Dracula.git
ln -s ~/Repositories/Ant-Dracula ~/.themes/Ant-Dracula
gsettings set org.gnome.desktop.interface gtk-theme "Ant-Dracula"
gsettings set org.gnome.desktop.wm.preferences theme "Ant-Dracula"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/dracula/zsh.git zsh-theme-dracula
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

git clone git@github.com:oleblaesing/shortkeys.git
cd shortkeys
npm i
npm run build chrome
cd -

ln -s ~/Repositories/dotfiles/.local/share/icons/hicolor/16x16/apps/discord.png ~/.local/share/icons/hicolor/16x16/apps/discord.png
ln -s ~/Repositories/dotfiles/.local/share/icons/hicolor/32x32/apps/discord.png ~/.local/share/icons/hicolor/32x32/apps/discord.png
ln -s ~/Repositories/dotfiles/.local/share/icons/hicolor/48x48/apps/discord.png ~/.local/share/icons/hicolor/48x48/apps/discord.png
ln -s ~/Repositories/dotfiles/.local/share/icons/hicolor/128x128/apps/discord.png ~/.local/share/icons/hicolor/128x128/apps/discord.png
ln -s ~/Repositories/dotfiles/.local/share/icons/hicolor/256x256/apps/discord.png ~/.local/share/icons/hicolor/256x256/apps/discord.png
ln -s ~/Repositories/dotfiles/.local/share/applications/Discord.desktop ~/.local/share/applications/Discord.desktop
```

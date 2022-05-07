# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo dnf remove cheese gnome-boxes gnome-contacts gnome-maps gnome-photos gnome-weather rhythmbox totem

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf upgrade --refresh
sudo dnf install \
  codium \
  curl \
  discord \
  firefox \
  fzf \
  git \
  neovim \
  nodejs \
  openssh \
  podman \
  VirtualBox \
  wget \
  xclip \
  xdg-open \
  zip \
  zsh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install electrum
flatpak install keepassxc
flatpak install libreoffice
flatpak install spotify

cp /run/media/$USER/UNTITLED/backup.zip.gpg ~/
gpg -d ~/backup.zip.gpg
unzip backup.zip
rm backup.zip

ln -s ~/Keys/.gnupg ~/.gnupg
gpg --import ~/Keys/gpg.sec.asc
gpg --import ~/Keys/gpg.pub.asc
gpg --import ~/Keys/gpg.sec.sub.asc
gpg --import-ownertrust ~/Keys/ownertrust.txt
gpg --edit-key ob@ob.codes
# gpg> trust
# Your decision? 5 (Ultimate trust)

ln -s ~/Repositories/dotfiles/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

mkdir ~/Repositories
cd ~/Repositories
git clone git@gitlab.com:oleblaesing/dotfiles.git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/Repositories/dotfiles/.oh-my-zsh/themes/ob.zsh-theme ~/.oh-my-zsh/themes/ob.zsh-theme
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
```

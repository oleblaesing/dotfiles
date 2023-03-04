# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf update
sudo dnf install \
  codium \
  neovim \
  VirtualBox \
  xclip \
  zsh

curl https://get.volta.sh | bash
volta install node@18

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install electrum
flatpak install keepassxc

cp /run/media/$USER/Backup/backup.zip.gpg ~/
gpg -d ~/backup.zip.gpg
unzip backup.zip
rm backup.zip

gpg --import ~/Keys/gpg.sec.asc
gpg --import ~/Keys/gpg.pub.asc
gpg --import ~/Keys/gpg.sec.sub.asc
gpg --import-ownertrust ~/Keys/ownertrust.txt
gpg --edit-key YOUR_EMAIL_MORON
# gpg> trust
# Your decision? 5 (Ultimate trust)
# gpg> save

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

ln -s ~/Repositories/dotfiles/.config/VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/keybindings.json ~/.config/VSCodium/User/keybindings.json
codium --install-extension bradlc.vscode-tailwindcss
codium --install-extension csstools.postcss
codium --install-extension dbaeumer.vscode-eslint
codium --install-extension esbenp.prettier-vscode
codium --install-extension naumovs.color-highlight
codium --install-extension Prisma.prisma
codium --install-extension rust-lang.rust-analyzer
codium --install-extension vadimcn.vscode-lldb

sudo dnf install xcb-util xcb-util-keysyms xcb-util-cursor SDL2 libva libva-utils libvdpau libinput mesa-libgbm libXdamage libXrandr libXcomposite nspr cups-libs libXdmcp libXi libbsd libXcursor libXtst atk alsa-lib nss libXScrnSaver at-spi2-atk gdk-pixbuf2 gtk3 gnome-keyring
wget wget "https://gitlab.com/aar642/shadow-repackaged/-/jobs/artifacts/main/raw/Shadow-x86_64.AppImage?job=build" -O ShadowRepackaged-x86_64.AppImage
sudo mkdir -p /usr/local/bin
sudo mv ShadowRepackaged-x86_64.AppImage /usr/local/bin/
sudo mkdir -p /usr/local/share/app-info/icons/256x256
sudo cp usr/local/share/app-info/icons/256x256/shadow.png /usr/local/share/app-info/icons/256x256/
sudo mkdir -p /usr/local/share/applications
sudo cp usr/local/share/applications/shadow.desktop /usr/local/share/applications/
```

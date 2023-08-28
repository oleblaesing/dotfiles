# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf update
sudo dnf install \
  code \
  neovim \
  xclip \
  zsh

curl https://get.volta.sh | bash
volta install node@18

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install electrum
flatpak install keepassxc
flatpak install signal

cp /run/media/$USER/Backup/backup.zip.gpg ~/
gpg -d ~/backup.zip.gpg
unzip backup.zip
rm backup.zip

ln -sf ~/Keys/.gnupg ~/.gnupg

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

mkdir -p ~/.config/Code
ln -s ~/Repositories/dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -s ~/Repositories/dotfiles/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
code --install-extension bradlc.vscode-tailwindcss
code --install-extension csstools.postcss
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension firefox-devtools.vscode-firefox-debug
code --install-extension naumovs.color-highlight
code --install-extension Prisma.prisma
code --install-extension vscodevim.vim

sudo dnf install xcb-util xcb-util-keysyms xcb-util-cursor SDL2 libva libva-utils libvdpau libinput mesa-libgbm libXdamage libXrandr libXcomposite nspr cups-libs libXdmcp libXi libbsd libXcursor libXtst atk alsa-lib nss libXScrnSaver at-spi2-atk gdk-pixbuf2 gtk3 gnome-keyring
wget wget "https://gitlab.com/aar642/shadow-repackaged/-/jobs/artifacts/main/raw/Shadow-x86_64.AppImage?job=build" -O ShadowRepackaged-x86_64.AppImage
sudo mkdir -p /usr/local/bin
sudo mv ShadowRepackaged-x86_64.AppImage /usr/local/bin/
sudo mkdir -p /usr/local/share/app-info/icons/256x256
sudo cp usr/local/share/app-info/icons/256x256/shadow.png /usr/local/share/app-info/icons/256x256/
sudo mkdir -p /usr/local/share/applications
sudo cp usr/local/share/applications/shadow.desktop /usr/local/share/applications/
```

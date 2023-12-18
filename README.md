# Dotfiles

Personal dotfiles, scripts and guides

## Installation

```sh
# Go through system settings

sudo systemctl enable systemd-resolved
sudo echo "DNS=194.242.2.4#base.dns.mullvad.net" > /etc/systemd/resolved.conf
sudo echo "DNSSEC=no" >> /etc/systemd/resolved.conf
sudo echo "DNSOverTLS=yes" >> /etc/systemd/resolved.conf
sudo echo "Domains=~." >> /etc/systemd/resolved.conf
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved
sudo systemctl restart NetworkManager

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf config-manager --add-repo https://rpm.librewolf.net/librewolf-repo.repo

sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf update
sudo dnf install \
  codium \
  golang \
  librewolf \
  neovim \
  syncthing \
  xclip \
  zsh

systemctl --user enable syncthing.service
systemctl --user start syncthing.service

curl https://get.volta.sh | bash
volta install node@18

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install electrum
flatpak install keepassxc
flatpak install obsidian
flatpak install signal

wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm
sudo dnf install appimagelauncher-2.2.0-travis995.0f91801.x86_64.rpm

curl --tlsv1.3 --output whonix-xfce-installer-cli --url https://www.whonix.org/dist-installer-cli
bash ./whonix-xfce-installer-cli -n
sudo mkdir -p /var/lib/shim-signed/mok
sudo openssl req -nodes -new -x509 -newkey rsa:2048 -outform DER -addext "extendedKeyUsage=codeSigning" -keyout /var/lib/shim-signed/mok/MOK.priv -out /var/lib/shim-signed/mok/MOK.der
sudo mokutil --import /var/lib/shim-signed/mok/MOK.der
sudo reboot

# Enroll MOK, after reboot:

sudo rcvboxdrv setup
bash ./whonix-xfce-installer-cli -n

cd Downloads
wget https://update.shadow.tech/launcher/prod/linux/ubuntu_18.04/ShadowPC.AppImage
# Open AppImage file
cd ..

cp /run/media/$USER/Backup/backup.zip.gpg ~/
gpg -d ~/backup.zip.gpg
unzip backup.zip
rm backup.zip

ln -s $(pwd)/Sync/Obsidian\ Vault ~/Documents/Obsidian\ Vault
ln -s $(pwd)/Sync/passwords.kdbx ~/Keys/passwords.kdbx

ssh-keygen -t ed25519
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

ln -sf ~/Keys/.gnupg ~/.gnupg

mkdir ~/Repositories
cd ~/Repositories
git clone git@github.com:oleblaesing/dotfiles.git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
ln -sf ~/Repositories/dotfiles/.zshrc ~/.zshrc

ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
ln -s ~/Repositories/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/VSCodium/User
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/keybindings.json ~/.config/VSCodium/User/keybindings.json

# Download vsix: https://marketplace.visualstudio.com/items?itemName=firefox-devtools.vscode-firefox-debug

codium --install-extension bradlc.vscode-tailwindcss
codium --install-extension csstools.postcss
codium --install-extension dbaeumer.vscode-eslint
codium --install-extension esbenp.prettier-vscode
codium --install-extension firefox-devtools.vscode-firefox-debug
codium --install-extension golang.go
codium --install-extension naumovs.color-highlight
codium --install-extension Prisma.prisma
codium --install-extension rust-lang.rust-analyzer
codium --install-extension vadimcn.vscode-lldb
codium --install-extension vscodevim.vim

# Make LibreWolf settings
# Install LibreWolf extensions: uBlock Origin, Dark Reader, Snowflake
# DNS over HTTPS: https://base.dns.mullvad.net/dns-query
```

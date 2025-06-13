# Dotfiles

In install land:

```sh
loadkeys de-latin1
iwctl --passphrase PASSPHRASE station wlan0 connect SSID
archinstall
```

Install packages:

- [ ] `exfat-utils`
- [ ] `fuse2`
- [ ] `fwupd`
- [ ] `git`
- [ ] `intel-ucode`
- [ ] `keepassxc`
- [ ] `less`
- [ ] `libreoffice-still`
- [ ] `man-db`
- [ ] `newsflash`
- [ ] `otf-comicshanns-nerd`
- [ ] `syncthing`
- [ ] `ufw`
- [ ] `unzip`
- [ ] `vlc`
- [ ] `wget`
- [ ] `xclip`
- [ ] `zip`
- [ ] `zsh`
- [ ] `zsh-completions`

## In chroot land:

```sh
sed -i 's/#de_DE\.UTF-8/de_DE\.UTF-8/' /etc/locale.gen
locale-gen
```

```conf
# /etc/systemd/resolved.conf
DNS=194.242.2.4#base.dns.mullvad.net
DNSSEC=no
DNSOverTLS=yes
Domains=~.
```

```conf
# /etc/locale.conf
LANG=en_US.UTF-8
LC_NUMERIC=de_DE.UTF-8
LC_TIME=de_DE.UTF-8
LC_MONETARY=de_DE.UTF-8
LC_PAPER=de_DE.UTF-8
LC_MEASUREMENT=de_DE.UTF-8
```

```conf
# /etc/pacman.conf
Color
ILoveCandy
VerbosePkgLists
ParallelDownloads = 5
```

```sh
systemctl enable systemd-resolved
systemctl enable ufw

ln -sf /run/systemd/resolve/stub-resolve.conf /etc/resolv.conf

ufw default deny
ufw enable

cd /home/USER
su USER

systemctl --user enable gcr-ssh-agent.socket

mkdir Repositories
cd Repositories

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S cake-wallet-bin
yay -S librewolf-bin
yay -S mullvad-vpn-bin
yay -S qflipper-bin
yay -S volta-bin
yay -S vscodium-bin

wget "https://update.shadow.tech/launcher/prod/linux/ubuntu_18.04/ShadowPC.AppImage"

systemctl --user enable syncthing.service
```

## In desktop land:

1. Go through system settings
2. Go through LibreWolf settings
   - Install LibreWolf extensions: Dark Reader, Multi-Container
   - DNS over HTTPS: https://base.dns.mullvad.net/dns-query

```sh
cp /run/media/$USER/Backup/backup.zip.gpg ~/
gpg -d ~/backup.zip.gpg
unzip backup.zip
rm backup.zip

mv backup/Documents/* Documents/
mv backup/Keys ./
mv backup/Sync ./

rm -rf ~/.gnupg
ln -sf ~/Keys/.gnupg ~/.gnupg
ln -s ~/Sync/passwords.kdbx ~/Keys/passwords.kdbx
```

```sh
ssh-keygen -t ed25519

# Provide key to GitHub/GitLab

mkdir Repositories
git clone git@github.com:oleblaesing/dotfiles.git Repositories/dotfiles

mkdir -p ~/.config/VSCodium/User
ln -s ~/Repositories/dotfiles/.vimrc ~/.vimrc
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/keybindings.json ~/.config/VSCodium/User/keybindings.json
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -sf ~/Repositories/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

ln -s ~/Repositories/.local/share/applications/Shadow.desktop ~/.local/share/applications/Shadow.desktop

volta install node@20
```

Open localhost:8384 and configure Syncthing

---

Download vsix: https://marketplace.visualstudio.com/items?itemName=firefox-devtools.vscode-firefox-debug

```sh
codium --install-extension bradlc.vscode-tailwindcss
codium --install-extension csstools.postcss
codium --install-extension dbaeumer.vscode-eslint
codium --install-extension esbenp.prettier-vscode
codium --install-extension Downloads/firefox-devtools.vscode-firefox-debug-VERSION.vsix
codium --install-extension naumovs.color-highlight
codium --install-extension vscodevim.vim
```

Apply Newsflash backup from backup

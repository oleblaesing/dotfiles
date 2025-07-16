# Dotfiles

In install land:

```sh
loadkeys de-latin1
iwctl --passphrase PASSPHRASE station wlan0 connect SSID
archinstall
```

Install packages:

- [ ] `curl`
- [ ] `exfat-utils`
- [ ] `fish`
- [ ] `fuse2`
- [ ] `fwupd`
- [ ] `git`
- [ ] `intel-ucode`
- [ ] `keepassxc`
- [ ] `kitty`
- [ ] `less`
- [ ] `libreoffice-still`
- [ ] `man-db`
- [ ] `newsflash`
- [ ] `otf-comicshanns-nerd`
- [ ] `serpl`
- [ ] `signal-desktop`
- [ ] `syncthing`
- [ ] `ufw`
- [ ] `unzip`
- [ ] `vlc`
- [ ] `wget`
- [ ] `xclip`
- [ ] `zip`

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

yay -S evil-helix-bin
yay -S librewolf-bin
yay -S qflipper-bin
yay -S volta-bin

wget "https://update.shadow.tech/launcher/prod/linux/ubuntu_18.04/ShadowPC.AppImage"

systemctl --user enable syncthing.service
```

## In desktop land:

1. Go through system settings
2. Go through LibreWolf settings
   - Install LibreWolf extensions: Dark Reader, Multi-Container

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

mkdir -p ~/.config/{fish,kitty}
ln -s ~/Repositories/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/Repositories/dotfiles/.config/fish/functions ~/.config/fish/functions
ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Repositories/dotfiles/.config/helix ~/.config/helix
ln -s ~/Repositories/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

ln -s ~/Repositories/.local/share/applications/Shadow.desktop ~/.local/share/applications/Shadow.desktop

volta install node

npm -g i typescript-language-server vscode-langservers-extracted@4.8.0 prettier
```

Open localhost:8384 and configure Syncthing

Apply Newsflash backup from backup

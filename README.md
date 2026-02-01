# Dotfiles

In install land:

```sh
loadkeys de-latin1
iwctl --passphrase PASSPHRASE station wlan0 connect SSID
archinstall
```

Install packages:

- [ ] `clang`
- [ ] `cups`
- [ ] `curl`
- [ ] `eslint_d`
- [ ] `exfat-utils`
- [ ] `fd`
- [ ] `fish`
- [ ] `fuse2`
- [ ] `fwupd`
- [ ] `gcc`
- [ ] `git`
- [ ] `hplip`
- [ ] `intel-ucode`
- [ ] `json-c`
- [ ] `keepassxc`
- [ ] `kitty`
- [ ] `less`
- [ ] `libreoffice-still`
- [ ] `man-db`
- [ ] `mise`
- [ ] `newsflash`
- [ ] `otf-comicshanns-nerd`
- [ ] `ripgrep`
- [ ] `rsync`
- [ ] `syncthing`
- [ ] `typescript-language-server`
- [ ] `ufw`
- [ ] `unzip`
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

```conf
# /etc/hosts

# music.ob.codes
```

```sh
systemctl enable systemd-resolved
systemctl enable ufw

ln -sf /run/systemd/resolve/stub-resolve.conf /etc/resolv.conf

ufw default deny
ufw enable

cd /home/USER
su USER

mkdir Repositories
cd Repositories

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S evil-helix-bin
yay -S librewolf-bin
yay -S qflipper-bin

wget "https://update.shadow.tech/launcher/prod/linux/ubuntu_18.04/ShadowPC.AppImage"
chmod +x ShadowPC.AppImage
mv ShadowPC.AppImage ~/Downloads/

systemctl --user enable syncthing.service
```

## In desktop land:

1. Go through system settings
2. Go through LibreWolf settings
  - Install LibreWolf extensions: Dark Reader
  - DNSOverHTTPS: `https://base.dns.mullvad.net/dns-query`

```sh
sudo hp-setup -i

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

ssh-keygen -t ed25519

# Provide key to GitHub/GitLab

git clone git@github.com:oleblaesing/dotfiles.git Repositories/dotfiles
git clone git@github.com:oleblaesing/eslint-lang-server.git Repositories/eslint-lang-server
git clone git@github.com:oleblaesing/music.git Repositories/music

make -C ~/Repositories/eslint-lang-server

mkdir -p ~/.config/fish
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications

ln -s ~/Repositories/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/Repositories/dotfiles/.config/fish/functions ~/.config/fish/functions
ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Repositories/dotfiles/.config/helix ~/.config/helix
ln -s ~/Repositories/dotfiles/.config/kitty ~/.config/kitty

ln -s ~/Repositories/eslint-lang-server/bin/eslint-lang-server ~/.local/bin/eslint-lang-server
ln -s ~/Repositories/music/upload-music.sh ~/.local/bin/upload-music

ln -s ~/Repositories/dotfiles/.local/share/applications/Shadow.desktop ~/.local/share/applications/Shadow.desktop
```

Open localhost:8384 and configure Syncthing

Apply Newsflash backup from backup

# Dotfiles

In install land:

```sh
loadkeys de-latin1
iwctl --passphrase PASSPHRASE station wlan0 connect SSID
archinstall
```

Install packages:

- [ ] `amd-ucode`
- [ ] `chromium`
- [ ] `curl`
- [ ] `docker`
- [ ] `docker-buildx`
- [ ] `docker-compose`
- [ ] `exfat-utils`
- [ ] `fd`
- [ ] `firefox`
- [ ] `fish`
- [ ] `fwupd`
- [ ] `git`
- [ ] `github-cli`
- [ ] `keepassxc`
- [ ] `kitty`
- [ ] `less`
- [ ] `linux-firmware`
- [ ] `man-db`
- [ ] `otf-comicshanns-nerd`
- [ ] `ripgrep`
- [ ] `tailscale`
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

```sh
systemctl enable --now systemd-resolved
systemctl enable docker.socket
systemctl enable --now tailscaled
systemctl enable --now ufw

usermod -aG docker USER

tailscale set operator=USER

ufw default deny
ufw enable

cd /home/USER
su USER

mkdir Repositories
cd Repositories

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S google-cloud-cli
yay -S evil-helix-bin
yay -S librewolf-bin
yay -S opencode-bin
yay -S volta-bin
```

## In desktop land:

1. Go through system settings
2. Go through LibreWolf settings
   - Install LibreWolf extensions: Dark Reader
   - DNSOverHTTPS: `https://base.dns.mullvad.net/dns-query`

```sh
cp /run/media/$USER/Backup/backup.zip.gpg ~/
gpg -d ~/backup.zip.gpg
unzip backup.zip
rm backup.zip

mv backup/Keys ./

rm -rf ~/.gnupg
ln -sf ~/Keys/.gnupg ~/.gnupg

ssh-keygen -t ed25519

# Provide key to GitHub/GitLab

git clone git@github.com:oleblaesing/dotfiles.git Repositories/dotfiles

mkdir -p ~/.config/fish
ln -s ~/Repositories/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/Repositories/dotfiles/.config/fish/functions ~/.config/fish/functions
ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Repositories/dotfiles/.config/helix ~/.config/helix
ln -s ~/Repositories/dotfiles/.config/kitty ~/.config/kitty
ln -s ~/Repositories/dotfiles/.config/opencode ~/.config/opencode

volta install node@22
volta install pnpm@10

npm -g i typescript-language-server vscode-langservers-extracted@4.8.0

gcloud auth login
gh auth login
opencode auth login
```

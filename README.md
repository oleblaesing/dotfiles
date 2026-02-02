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
- [ ] `clamav`
- [ ] `clang`
- [ ] `curl`
- [ ] `docker`
- [ ] `docker-buildx`
- [ ] `docker-compose`
- [ ] `eslint_d`
- [ ] `exfat-utils`
- [ ] `firefox`
- [ ] `fish`
- [ ] `fwupd`
- [ ] `gcc`
- [ ] `git`
- [ ] `github-cli`
- [ ] `json-c`
- [ ] `keepassxc`
- [ ] `kitty`
- [ ] `less`
- [ ] `linux-firmware`
- [ ] `man-db`
- [ ] `mise`
- [ ] `otf-comicshanns-nerd`
- [ ] `tailscale`
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
{
  "dns": ["1.1.1.1", "1.0.0.1"]
}
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

# Follow steps here: https://wiki.archlinux.org/title/ClamAV

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
ln -s ~/Repositories/dotfiles/.config/opencode ~/.config/opencode

ln -s ~/Repositories/eslint-lang-server/bin/eslint-lang-server ~/.local/bin/eslint-lang-server

gcloud auth login
gh auth login
opencode auth login
```

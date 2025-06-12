# Dotfiles

In install land:

```sh
loadkeys de-latin1
iwctl --passphrase PASSPHRASE station wlan0 connect SSID
archinstall
```

Install packages:

- [ ] `chromium`
- [ ] `exfat-utils`
- [ ] `firefox`
- [ ] `fwupd`
- [ ] `git`
- [ ] `intel-ucode`
- [ ] `keepassxc`
- [ ] `less`
- [ ] `libreoffice-still`
- [ ] `man-db`
- [ ] `neovim`
- [ ] `otf-comicshanns-nerd`
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

yay -S librewolf-bin
yay -S volta-bin
yay -S vscodium-bin
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

rm -rf ~/.gnupg
ln -sf ~/Keys/.gnupg ~/.gnupg
```

```sh
ssh-keygen -t ed25519

# Provide key to GitHub/GitLab

mkdir Repositories
git clone git@github.com:oleblaesing/dotfiles.git Repositories/dotfiles

mkdir -p ~/.config/nvim
mkdir -p ~/.config/VSCodium/User
ln -s ~/Repositories/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/keybindings.json ~/.config/VSCodium/User/keybindings.json
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -sf ~/Repositories/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc

volta install node@20
```

Download vsix: https://marketplace.visualstudio.com/items?itemName=firefox-devtools.vscode-firefox-debug

```sh
codium --install-extension dbaeumer.vscode-eslint
codium --install-extension esbenp.prettier-vscode
codium --install-extension naumovs.color-highlight
codium --install-extension vscodevim.vim
```

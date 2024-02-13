# Dotfiles

In install land:

```sh
loadkeys de-latin1
iwctl --passphrase PASSPHRASE station wlan0 connect SSID
archinstall
```

Install packages:

- [ ] `electrum`
- [ ] `firefox`
- [ ] `fwupd`
- [ ] `git`
- [ ] `go`
- [ ] `keepassxc`
- [ ] `less`
- [ ] `libreoffice-still`
- [ ] `neovim`
- [ ] `obsidian`
- [ ] `rustup`
- [ ] `signal-desktop`
- [ ] `syncthing`
- [ ] `ufw`
- [ ] `unzip`
- [ ] `vlc`
- [ ] `wget`
- [ ] `xclip`
- [ ] `zip`
- [ ] `zsh`
- [ ] `zsh-completions`

In post-install land:

```sh
cd /home/USER
su USER

mkdir Repositories
cd Repositories

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S librewolf-bin
yay -S qflipper-bin
yay -S shadow-tech
yay -S volta-bin
yay -S vscodium-bin

volta install node@20
rustup default stable

exit
```

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

```sh
systemctl enable systemd-resolved
systemctl enable ufw
```

In desktop land:

```sh
ln -sf /run/systemd/resolve/stub-resolve.conf /etc/resolv.conf
sudo systemctl restart systemd-resolved
sudo systemctl restart NetworkManager
```

1. Go through system settings
2. Go through LibreWolf settings
   - Install LibreWolf extensions: Dark Reader, Multi-Container, Snowflake
   - DNS over HTTPS: https://base.dns.mullvad.net/dns-query

```sh
mkdir -p ~/.config/nvim
mkdir -p ~/.config/VSCodium/User

cp /run/media/$USER/Backup/backup.zip.gpg ~/
gpg -d ~/backup.zip.gpg
unzip backup.zip
rm backup.zip

mv backup/Documents/* Documents/
mv backup/Keys ./
mv backup/Sync ./
```

```sh
ssh-keygen -t ed25519
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Provide key to GitHub/GitLab

git clone git@github.com:oleblaesing/dotfiles.git Repositories/dotfiles
```

```sh
rm -rf ~/.gnupg
ln -sf ~/Keys/.gnupg ~/.gnupg
ln -s ~/Repositories/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/keybindings.json ~/.config/VSCodium/User/keybindings.json
ln -s ~/Repositories/dotfiles/.config/VSCodium/User/settings.json ~/.config/VSCodium/User/settings.json
ln -s ~/Repositories/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Sync/Obsidian\ Vault ~/Documents/Obsidian\ Vault
ln -s ~/Sync/passwords.kdbx ~/Keys/passwords.kdbx
```

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
ln -sf ~/Repositories/dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

```sh
systemctl --user enable syncthing.service
systemctl --user start syncthing.service
```

Open localhost:8384 and configure

---

Download vsix: https://marketplace.visualstudio.com/items?itemName=firefox-devtools.vscode-firefox-debug

```sh
codium --install-extension bradlc.vscode-tailwindcss
codium --install-extension csstools.postcss
codium --install-extension dbaeumer.vscode-eslint
codium --install-extension esbenp.prettier-vscode
codium --install-extension Downloads/firefox-devtools.vscode-firefox-debug-VERSION.vsix
codium --install-extension golang.go
codium --install-extension naumovs.color-highlight
codium --install-extension rust-lang.rust-analyzer
codium --install-extension vadimcn.vscode-lldb
codium --install-extension vscodevim.vim
```

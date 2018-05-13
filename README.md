# Dotfiles

Personal dotfiles and configuration scripts

## Installation

OS and default application settings

Secure network

```sh
sudo dscl . delete /Users/$USER jpegphoto
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false
sudo networksetup -setdnsservers "Wi-Fi" 1.1.1.1
curl "https://raw.githubusercontent.com/oleblaesing/dotfiles/master/etc/hosts" | sudo tee -a /etc/hosts
```

Install
- Firefox (using [privacytools.io](https://www.privacytools.io/))
  - Preferences
  - Customize
  - `about:config`
  - HTTPS Everywhere
  - uBlock Origin
  - uMatrix
  - User-Agent-Switcher
- GPGTools
- KeePassX
- OpenVPN
- iTerm2

```sh
xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off && brew update && brew upgrade
brew install openssl
brew install openssh --with-brewed-openssl
brew install curl zsh tmux git neovim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /usr/local/bin/zsh

mkdir Code
./Code
git clone https://github.com/oleblaesing/dotfiles.git

ln -s /Users/$USER/Code/dotfiles/zsh/.zshrc ~/.zshrc
ln -s /Users/$USER/Code/dotfiles/zsh/themes/macos.zsh-theme ~/.oh-my-zsh/themes/macos.zsh-theme
ln -s /Users/$USER/Code/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s /Users/$USER/Code/dotfiles/curl/.curlrc ~/.curlrc
ln -s /Users/$USER/Code/dotfiles/git/.gitconfig ~/.gitconfig
ln -s /Users/$USER/Code/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s /Users/$USER/Code/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

source ~/.zshrc

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
```

Install
- WhatsApp Desktop
- Spotify
- Google Chrome
- Docker
- Visual Studio Code
- TorBrowser
- VirtualBox
- Wireshark
- Transmission

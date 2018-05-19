# Dotfiles

Personal dotfiles, scripts and guides

![Screenshot](https://raw.githubusercontent.com/oleblaesing/dotfiles/master/screenshot.png "Screenshot")

## Installation

After going through system and Finder settings

```sh
sudo dscl . delete /Users/$USER jpegphoto
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false
sudo networksetup -setdnsservers "Wi-Fi" 1.1.1.1
curl "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/hosts

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off
brew update && brew upgrade
brew install openssl
brew install openssh --with-brewed-openssl
brew install curl zsh tmux neovim git gpg
brew cask install iterm2 keepassxc firefox thunderbird nordvpn spotify whatsapp
brew cask install docker google-chrome torbrowser virtualbox transmission wireshark

chsh -s /usr/local/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/Code
~/Code
git clone https://github.com/oleblaesing/dotfiles.git

ln -sf /Users/$USER/Code/dotfiles/zsh/.zshrc ~/.zshrc
ln -s /Users/$USER/Code/dotfiles/zsh/themes/macos.zsh-theme ~/.oh-my-zsh/themes/macos.zsh-theme
ln -s /Users/$USER/Code/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s /Users/$USER/Code/dotfiles/curl/.curlrc ~/.curlrc
ln -s /Users/$USER/Code/dotfiles/git/.gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim
ln -s /Users/$USER/Code/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

source ~/.zshrc

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall
```

## Firefox
- Preferences
- Customize
- `about:config`
- HTTPS Everywhere
- uBlock Origin
- uMatrix
- User-Agent-Switcher

## Thunderbird
- Preferences
- Enigmail

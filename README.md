# Dotfiles

Personal dotfiles, scripts and guides

![Screenshot](screenshot.png "Screenshot")

## Installation

Go through system settings, Finder settings and restore backup files

```sh
sudo dscl . delete /Users/$USER jpegphoto
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.captive.control Active -bool false
sudo networksetup -setdnsservers "Wi-Fi" 1.1.1.1
curl "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/hosts

xcode-select --install

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off
brew update && brew upgrade
brew install openssl openssh curl zsh tmux neovim git gpg
brew cask install iterm2 keepassxc firefox thunderbird nordvpn spotify
brew cask install docker google-chrome torbrowser libreoffice

chsh -s /usr/local/bin/zsh
zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ln -s ~/Keys/ssh ~/.ssh
ssh-add ~/.ssh/ole.blaesing@web.de

mkdir ~/Repositories
~/Repositories
git clone https://github.com/oleblaesing/dotfiles.git
git clone https://github.com/oleblaesing/flamingo-galaxy.git

ln -sf ~/Repositories/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/Repositories/dotfiles/zsh/themes/macos.zsh-theme ~/.oh-my-zsh/themes/macos.zsh-theme
ln -s ~/Repositories/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/Repositories/dotfiles/curl/.curlrc ~/.curlrc
ln -s ~/Repositories/dotfiles/git/.gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim
ln -s ~/Repositories/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/Repositories/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/Repositories/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Repositories/User/keybindings.json

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

## VSCode
- Flamingo Galaxy
- EditorConfig

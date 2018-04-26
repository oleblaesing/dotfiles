# Dotfiles

Personal dotfiles and configuration scripts

## Installation

First of all copy the passwords db and ssh keys from external drive to local drive

```sh
cp /Volumes/Data/Keys ~/
ln -sf /Users/oleblaesing/Keys/ssh/* /Users/oleblaesing/.ssh/
```

Use a more secure hosts file

```sh
cp /Users/oleblaesing/Code/dotfiles/etc/hosts /etc/hosts
```

Use Google DNS

```sh
sudo networksetup -setdnsservers "Wi-Fi" 8.8.8.8 8.8.4.4
```

Now install the basic macOS development tools

```sh
xcode-select --install
```

Install brew and deps

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off && brew update && brew upgrade
brew install openssl
brew install openssh --with-brewed-openssl --with-keychain-support
brew install zsh tmux curl git neovim
brew cask install dnscrypt wireshark
```

Configure and start DNSCrypt

Install PrivateInternetAccess, configure and start it

Install oh-my-zsh for zsh enhancement and use zsh as the default shell

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /usr/local/bin/zsh
```

Now clone this repository and use the files

```sh
mkdir Code
cd Code
git clone https://github.com/oleblaesing/dotfiles.git
ln -sf /Users/oleblaesing/Code/dotfiles/ssh/config ~/.ssh/config
ln -sf /Users/oleblaesing/Code/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf /Users/oleblaesing/Code/dotfiles/zsh/themes ~/.oh-my-zsh/themes
ln -sf /Users/oleblaesing/Code/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf /Users/oleblaesing/Code/dotfiles/curl/.curlrc ~/.curlrc
ln -sf /Users/oleblaesing/Code/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf /Users/oleblaesing/Code/dotfiles/nvim ~/.config/nvim
```

Install the vim plugins

```sh
source ~/.zshrc
v +PlugInstall
```

Install iTerm2, Docker, KeePassX, GPGTools, VirtualBox and Visual Studio Code
Select iTerm2 config file and start iTerm2
Import PGP key in GPG

Install Firefox, set it up, customize it, install uBlock origin and HTTPS Everywhere, import bookmarks
Install Google Chrome
Install TorBrowser

Install WhatsApp, Spotify

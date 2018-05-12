# Dotfiles

Personal dotfiles and configuration scripts

## Installation

Download wallpaper

```sh
wget https://github.com/oleblaesing/dotfiles/raw/master/wallpaper.png
```

Walkthrough settings

Copy the passwords db and ssh keys from external drive to local drive

```sh
cp /Volumes/Data/Keys ~/
ln -sf /Users/$USER/Keys/ssh/* /Users/$USER/.ssh/
```

Use a more secure hosts file

```sh
curl "https://raw.githubusercontent.com/oleblaesing/dotfiles/master/etc/hosts" | sudo tee -a /etc/hosts
```

Use public DNS

```sh
sudo networksetup -setdnsservers "Wi-Fi" 1.1.1.1
```

Install KeePassX
Install and configure DNSCrypt
Install and configure NordVPN

Now install the basic macOS development tools

```sh
xcode-select --install
```

Install brew and deps

```sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off && brew update && brew upgrade
brew install openssl
brew install openssh --with-brewed-openssl
brew install zsh tmux curl git neovim
```

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
ln -sf /Users/$USER/Code/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf /Users/$USER/Code/dotfiles/zsh/themes ~/.oh-my-zsh/themes
ln -sf /Users/$USER/Code/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf /Users/$USER/Code/dotfiles/curl/.curlrc ~/.curlrc
ln -sf /Users/$USER/Code/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf /Users/$USER/Code/dotfiles/nvim ~/.config/nvim
```

Install the vim plugins

```sh
source ~/.zshrc
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
v +PlugInstall
```

Install iTerm2, Docker, GPGTools, VirtualBox, Visual Studio Code, Transmission

Select iTerm2 config file and start iTerm2

Import PGP key in GPG

Install Firefox, set it up, customize it, edit `about:config`, install HTTPS Everywhere, uBlock Origin, uMatrix, UserAgent Switcher

Install Google Chrome

Install TorBrowser

Install WhatsApp, Spotify

# Dotfiles

Personal dotfiles and configuration scripts

## Installation

```sh
# First of all copy the passwords db and ssh keys from external drive to local drive
cp /Volumes/Data/Keys ~/
ln -sf /Users/oleblaesing/Keys/ssh/* /Users/oleblaesing/.ssh/

cp /Users/oleblaesing/Code/dotfiles/etc/hosts /etc/hosts

# Now install the basic macOS development tools
xcode-select --install

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off && brew update && brew upgrade
brew install openssl
brew install openssh --with-brewed-openssl --with-keychain-support
brew install zsh tmux curl git neovim

# Install oh-my-zsh for zsh enhancement and use zsh as the default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /usr/local/bin/zsh

# Now clone this repository and use the files
mkdir Code
cd Code
git clone https://github.com/oleblaesing/dotfiles.git
ln -sf /Users/oleblaesing/Code/dotfiles/ssh/config ~/.ssh/config
ln -sf /Users/oleblaesing/Code/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf /Users/oleblaesing/Code/dotfiles/zsh/themes ~/.oh-my-zsh/custom
ln -sf /Users/oleblaesing/Code/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf /Users/oleblaesing/Code/dotfiles/curl/.curlrc ~/.curlrc
ln -sf /Users/oleblaesing/Code/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf /Users/oleblaesing/Code/dotfiles/nvim ~/.config/nvim

# Start services
sudo networksetup -setdnsservers "Wi-Fi" 8.8.8.8 8.8.4.4

# Install the vim plugins
source ~/.zshrc
v +PlugInstall

# Install iTerm, Docker, Sequel Pro
# Select iTerm config file and start iTerm
```

# Dotfiles

Personal dotfiles and configuration scripts

## Installation

```sh
# First of all copy the passwords db and ssh keys from external drive to local drive
cp /Volumes/Data/passwords.kdbx ~/
cp /Volumes/Data/.ssh ~/
cp /Volumes/Data/gpg.asc ~/

# Now install the basic macOS development tools
xcode-select --install

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew analytics off && brew update && brew upgrade
brew install openssl
brew install openssh --with-brewed-openssl --with-keychain-support
brew install zsh tmux fzf vim git curl node yarn ghc

# Install oh-my-zsh for zsh enhancement and use zsh as the default shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /usr/local/bin/zsh

# Now clone this repository and use the files
mkdir Code
cd Code
git clone https://github.com/oleblaesing/dotfiles.git
ln -sf /Users/oleblaesing/Code/dotfiles/ssh/config ~/.ssh/config
ln -sf /Users/oleblaesing/Code/dotfiles/curl/.curlrc ~/.curlrc
ln -sf /Users/oleblaesing/Code/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf /Users/oleblaesing/Code/dotfiles/zsh/themes ~/.oh-my-zsh/custom
ln -sf /Users/oleblaesing/Code/dotiles/vim/.vimrc ~/.vimrc
ln -sf /Users/oleblaesing/Code/dotiles/vim/colors ~/.vim
ln -sf /Users/oleblaesing/Code/dotfiles/git/.gitconfig ~/.gitconfig

# Install the vim plugins
vim +PluginInstall +qall

# Select Terminal.app/Development.terminal as the Terminal.app theme and restart the terminal
# Install Docker, Sequel Pro
```

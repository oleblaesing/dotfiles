# Dotfiles

Personal dotfiles, scripts and guides

![Screenshot](https://raw.githubusercontent.com/oleblaesing/dotfiles/master/screenshot.png "Screenshot")

## Installation

After going through system and Finder settings

```sh
sudo vi /etc/resolv.conf
curl "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts" | sudo tee -a /etc/hosts

sudo pacman -Syu
sudo pacman -S base-devel yaourt dmenu zsh tmux neovim git keepassxc openvpn
sudo pacman -S firefox thunderbird transmission-gtk docker virtualbox wireshark-qt
yaourt spotify google-chrome

# Install tor-browser
# Shortcuts for dmenu_run

chsh -s /usr/bin/zsh
zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir ~/Code
~/Code
git clone https://github.com/oleblaesing/dotfiles.git

ln -sf ~/Code/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/Code/dotfiles/zsh/themes/macos.zsh-theme ~/.oh-my-zsh/themes/macos.zsh-theme
ln -s ~/Code/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/Code/dotfiles/curl/.curlrc ~/.curlrc
ln -s ~/Code/dotfiles/git/.gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim
ln -s ~/Code/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/Code/dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/Code/dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json

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

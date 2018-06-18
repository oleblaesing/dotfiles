export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="macos"
DISABLE_AUTO_UPDATE="true"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

alias b="~/Code/dotfiles/backup.sh"
alias gip="curl ipinfo.io/ip"
alias i="~/Code/dotfiles/info.sh"
alias o="grep -inIEr --color=ALWAYS"
alias s="sudo"
alias u="~/Code/dotfiles/update.sh"
alias v="nvim"

alias d="docker"
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dcd="docker-compose down"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias dr="docker run"

alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gck="git checkout"
alias gcrp="git-commit-rebase-push"
alias gd="git diff"
alias gf="git fetch --all --prune"
alias gl="git log"
alias gm="git merge"
alias gr="git rebase"
alias gs="git status --short --branch"

alias p="sudo pacman"
alias pi="sudo pacman -S"
alias brm="sudo pacman -R"

export EDITOR="/usr/bin/vi -e"
export PATH="$HOME/.npm-global/bin:$PATH"
export VISUAL="/usr/bin/nvim"

git-commit-rebase-push() {
  git add .
  git commit -m "Auto commit! Should be squashed"
  git fetch --all
  git rebase -i $1
  git push -f
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

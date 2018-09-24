export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="macos"
DISABLE_AUTO_UPDATE="true"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

alias bu="~/Code/dotfiles/backup.sh"
alias ip="curl ipinfo.io/ip"
alias o="grep -inIEr --color=ALWAYS"
alias s="sudo"
alias u="~/Code/dotfiles/update.sh"
alias v="nvim"

alias b="brew"
alias bi="brew install"
alias brm="brew remove"

alias bc="brew cask"
alias bci="brew cask install"
alias bcrm="brew cask remove"

alias d="docker"
alias de="docker exec"
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dcd="docker-compose down"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias di="docker images"
alias dps="docker ps"
alias dr="docker run"
alias drm="docker rm"
alias drmi="docker rmi"
alias ds="docker stop"

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

alias y="yarn"
alias ya="yarn add"
alias yb="yarn run build"
alias ys="yarn run start"
alias yt="yarn test"

export EDITOR="/usr/bin/vi -e"
export LANGUAGE="en_US.UTF-8"
export PATH="/usr/local/bin:$PATH"
export VISUAL="/usr/local/bin/nvim"

git-commit-rebase-push() {
  git add .
  git commit -m "Auto commit! Should be squashed"
  git fetch --all
  git rebase -i $1
  git push -f
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

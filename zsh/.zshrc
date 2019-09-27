export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="macos"
DISABLE_AUTO_UPDATE="true"

plugins=(git docker zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias backup="~/Repositories/dotfiles/backup.sh"
alias puip="curl ipinfo.io/ip"
alias s="sudo"
alias u="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias v="nvim"

alias c="cargo"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cc="cargo check"
alias cdo="cargo doc --open"
alias cr="cargo run"

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
alias gd="git diff"
alias gf="git fetch --all --prune"
alias gl="git log"
alias gm="git merge"
alias gr="git rebase"
alias gs="git status --short --branch"

export EDITOR="/usr/bin/vi -e"
export LANGUAGE="en_US.UTF-8"
export PATH="$HOME/.cargo/bin:/usr/local/sbin:/usr/local/bin:$PATH"
export VISUAL="/usr/bin/nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

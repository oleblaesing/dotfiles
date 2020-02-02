export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dracula"
DISABLE_AUTO_UPDATE="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias pbcopy="xclip -sel clip"
alias s="sudo"
alias v="nvim"

alias c="cargo"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cc="cargo check"
alias cr="cargo run"

alias d="docker"
alias de="docker exec"
alias dc="docker-compose"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias di="docker images"
alias dr="docker run"
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

function backup() {
  zip -r backup.zip ~/Documents ~/Keys
  gpg -c backup.zip
  rm backup.zip
  mv backup.zip.gpg /run/media/solitude/UNTITLED/
  umount /run/media/solitude/UNTITLED/
}

unalias l

function l() {
  if [[ -z $1 ]]; then
    echo "-z"
    ls -al
  else
    if [[ -d $1 ]]; then
      echo "-d"
      ls -al $1
    else
      less $1
    fi
  fi
}

export EDITOR="/usr/bin/vi -e"
export LANGUAGE="en_US.UTF-8"
export PATH="$HOME/.cargo/bin:$PATH"
export VISUAL="/usr/bin/nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

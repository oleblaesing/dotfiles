export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"

plugins=(zsh-syntax-highlighting git npm)

source $ZSH/oh-my-zsh.sh

alias s="sudo"
alias v="nvim"

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

alias n="npm"
alias ni="npm i"
alias nb="npm run build"
alias nl="npm run lint"
alias nt="npm run test"
alias nw="npm run dev"

function b() {
  zip -r backup.zip ~/Documents ~/Keys ~/Sync
  gpg -c backup.zip
  rm backup.zip
  mv backup.zip.gpg /run/media/$USER/Backup/
  umount /run/media/$USER/Backup/
}

unalias l

function l() {
  if [[ -z $1 ]]; then
    ls -al
  else
    if [[ -d $1 ]]; then
      ls -al $1
    else
      less $1
    fi
  fi
}

function u() {
  yay
  omz update
  sudo fwupdmgr update
}

export EDITOR="nvim -e"
export VOLTA_HOME="$HOME/.volta"
export PATH="$(go env GOBIN):$(go env GOPATH)/bin:$VOLTA_HOME/bin:$PATH"
export VISUAL="code --wait"

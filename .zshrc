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

alias n="pnpm"
alias ni="pnpm i"
alias nb="pnpm run build"
alias nl="pnpm run lint"
alias nt="pnpm run test"
alias nw="pnpm --filter"

function b() {
  zip -r backup.zip ~/Documents ~/Keys
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
export PATH="$VOLTA_HOME/bin:$PATH"
export VISUAL="code --wait"

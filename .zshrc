export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dracula"
DISABLE_AUTO_UPDATE="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias co="xclip -sel clip"
alias o="xdg-open"
alias pa="xclip -o -sel clip"
alias s="sudo"
alias t="transmission-cli"
alias v="nvim"

alias c="cargo"
alias ci="cargo install"
alias cb="cargo build"
alias cr="cargo run"

alias d="podman"
alias db="podman build"
alias de="podman exec"
alias di="podman images"
alias dps="podman ps"
alias dr="podman run"
alias ds="podman stop"

alias dc="podman-compose"
alias dcd="podman-compose down"
alias dcu="podman-compose up"

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

function b() {
  zip -r backup.zip ~/Documents ~/Keys
  gpg -c backup.zip
  rm backup.zip
  mv backup.zip.gpg /run/media/solitude/UNTITLED/
  umount /run/media/solitude/UNTITLED/
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

export EDITOR="/usr/bin/vi -e"
export PATH="$HOME/.cargo/bin:$PATH"
export VISUAL="/usr/bin/nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

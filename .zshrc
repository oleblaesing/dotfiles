export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ob"
DISABLE_AUTO_UPDATE="true"

plugins=(zsh-syntax-highlighting fzf git npm rust)

source $ZSH/oh-my-zsh.sh

alias co="xclip -sel clip"
alias o="xdg-open"
alias s="sudo"
alias v="nvim"

alias c="cargo"
alias ci="cargo install"
alias cb="cargo build"
alias cr="cargo run"

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
  zip -r backup.zip ~/Documents ~/Keys
  gpg -c backup.zip
  rm backup.zip
  mv backup.zip.gpg /run/media/$USER/UNTITLED/
  umount /run/media/$USER/UNTITLED/
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
  sudo dnf upgrade
  flatpak update
  omz update
  rustup update
  sudo fwupdmgr update
}

export EDITOR="vi -e"
export PATH="$HOME/.cargo/bin:$PATH"
export VISUAL="codium --wait"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="dracula"
DISABLE_AUTO_UPDATE="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias c="xclip -sel clip"
alias o="xdg-open"
alias p="xclip -o -sel clip"
alias s="sudo"
alias v="nvim"

alias d="podman"
alias db="podman build"
alias de="podman exec"
alias di="podman images"
alias dps="podman ps"
alias dr="podman run"
alias ds="podman stop"

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

function y() {
  artist="$1"
  title="$2"
  album="$3"
  url="$4"

  source="$HOME/Music/$artist - $title"
  target="/run/user/1000/gvfs/mtp:host=Xiaomi_Mi_A1_264996fc9805/Internal shared storage/Music/"

  youtube-dl -x --audio-format mp3 --audio-quality 0 -o "$source.%(ext)s" "$url"
  id3v2 -a "$artist" -t "$title" -A "$album" "$source.mp3"

  if [[ -d "$target" ]]; then
    cp "$source.mp3" "$target"
  else
    echo "Target device storage not available"
  fi
}

export EDITOR="/usr/bin/vi -e"
export VISUAL="/usr/bin/nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

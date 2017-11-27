export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="macos"
DISABLE_AUTO_UPDATE="true"
plugins=(osx brew git docker node yarn)

source $ZSH/oh-my-zsh.sh

alias ddu="decrypt-decompress-unpack"
alias hg="history | grep"
alias o="grep -inIEr --color=ALWAYS"
alias pce="pack-compress-encrypt"
alias pw="openssl rand -base64 32 | tr -d '\n' | pbcopy && pbpaste"
alias s="sudo"
alias u="~/Code/dotfiles/update.sh"
alias v="nvim"

alias b="brew"
alias bi="brew install"
alias brm="brew remove"

alias d="docker"
alias dc="docker-compose"
alias dcb="docker-compose build"
alias dce="docker-compose exec"
alias dcd="docker-compose down"
alias dcs="docker-compose stop"
alias dcu="docker-compose up"
alias di="docker images"
alias dps="docker ps -a"
alias dr="docker run"
alias drm="docker rm"
alias drmi="docker rmi"

alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gck="git checkout"
alias gd="git diff"
alias gf="git fetch --all --prune"
alias gl="git log --graph --abbrev-commit --decorate --all"
alias gm="git merge"
alias gr="git rebase"
alias gcrp="git-commit-rebase-push"
alias gs="git status --short --branch"

alias y="yarn"
alias ya="yarn add"
alias yb="yarn run build"
alias yt="yarn test"
alias yrm="yarn remove"
alias yu="yarn upgrade"
alias yw="yarn run watch"

export EDITOR="/usr/bin/vi -e"
export PATH="$HOME/.composer/vendor/bin:/usr/local/bin:$PATH"
export VISUAL="/usr/local/bin/nvim"

git-commit-rebase-push() {
  git add .
  git commit -m "Auto commit! Should be squashed"
  git fetch --all
  git rebase $1
  git rebase -i $1
  git push -f
}

pack-compress-encrypt() {
  echo "Password: "
  read -s pass
  tar -c $1 | gzip | openssl enc -aes-256-cbc -k $pass -out $1.tar.gz.enc
}

decrypt-decompress-unpack() {
  echo "Password: "
  read -s pass
  openssl enc -in $1 -aes-256-cbc -d -k $pass | gzip -d | tar -x
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="macos"
DISABLE_AUTO_UPDATE="true"

plugins=(git docker)

source $ZSH/oh-my-zsh.sh

alias o="grep -inIEr --color=ALWAYS"
alias gpw="get-password"
alias s="sudo"
alias spw="set-password"
alias u="~/Code/dotfiles/update.sh"
alias v="nvim"

alias b="brew"
alias bi="brew install"
alias brm="brew remove"

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

export EDITOR="/usr/bin/vi -e"
export PATH="/usr/local/bin:$PATH"
export VISUAL="/usr/local/bin/nvim"

get-password() {
  gpg -do - ~/Keys/passwords.gpg | grep -i $1
}

set-password() {
  mv -f ~/Keys/passwords.gpg ~/Keys/passwords.gpg.bak
  printf "$(gpg -do - ~/Keys/passwords.gpg.bak)\n$1" | gpg -co ~/Keys/passwords.gpg
}

git-commit-rebase-push() {
  git add .
  git commit -m "Auto commit! Should be squashed"
  git fetch --all
  git rebase -i $1
  git push -f
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

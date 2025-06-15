set -Ux EDITOR vim
set -Ux VISUAL vim
set -Ux VOLTA_HOME "$HOME/.volta"
fish_add_path "$VOLTA_HOME/bin"

bind up up-line-or-beginning-search

alias s="sudo"
alias v="vim"

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

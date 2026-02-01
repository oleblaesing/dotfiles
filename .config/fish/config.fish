set -Ux EDITOR hx
set -Ux VISUAL hx

fish_add_path "$HOME/.local/bin"

bind up up-line-or-beginning-search

alias s="sudo"
alias ssh="kitten ssh"
alias um="upload-music"

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

mise activate fish | source

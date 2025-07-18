set -Ux EDITOR hx
set -Ux VISUAL hx
set -Ux VOLTA_HOME "$HOME/.volta"
fish_add_path "$VOLTA_HOME/bin"

bind up up-line-or-beginning-search
bind \cz 'fg 2>/dev/null; commandline -f repaint'

alias s="sudo"

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

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

alias n="pnpm"
alias ni="pnpm i"
alias nb="pnpm run build"
alias nbf="NODE_ENV=development pnpm --filter @heyflow/flow-sdk run build && pnpm --filter @heyflow/flow run build:dev"
alias nbs="NODE_ENV=development pnpm --filter @heyflow/interfaces run build && NODE_ENV=development pnpm --filter @heyflow/shared run build && NODE_ENV=development pnpm --filter @heyflow/shared-backend run build"
alias nl="pnpm run lint"
alias nt="pnpm run test"
alias nw="pnpm --filter"

mise activate fish | source

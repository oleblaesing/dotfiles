# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="macos"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx brew git docker node yarn)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias hg="history | grep"
alias o="grep -inIEr --color=ALWAYS"
alias pw="openssl rand -base64 32 | tr -d '\n' | pbcopy && pbpaste"
alias s="sudo"
alias u="update"
alias v="vim"

alias b="brew"
alias bi="brew install"
alias br="brew remove"
alias bu="brew update"

alias d="docker"
alias db="docker build"
alias dc="docker-deploy"
alias dcb="docker-deploy build"
alias dce="docker-deploy exec"
alias dcd="docker-deploy down"
alias dcs="docker-deploy stop"
alias dcu="docker-deploy up"
alias di="docker images"
alias dk="docker kill"
alias dps="docker ps -a"
alias dr="docker run"
alias drm="docker rm"
alias drmi="docker rmi"
alias ds="docker stop"

alias g="git"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gck="git checkout"
alias gd="git diff"
alias gf="git fetch --all --prune"
alias gi="git init"
alias gl="git log --graph --abbrev-commit --decorate --all"
alias gm="git merge"
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gcrp="git-commit-rebase-push"
alias gs="git status --short --branch"

alias h="heroku"
alias hc="heroku config:set"
alias hd="git push heroku master"
alias hl="heroku logs"
alias ho="heroku open"

alias n="npm"
alias nb="npm run build"
alias ni="npm install"
alias nr="npm run"
alias nrm="npm remove"
alias ns="npm run start"
alias nt="npm test"
alias nu="npm upgrade"
alias nw="npm run watch"
alias nx="npx"

export EDITOR="/usr/bin/vi -e"
export PATH="$HOME/.composer/vendor/bin:/usr/local/bin:$PATH"
export VISUAL="/usr/local/bin/vim"

update() {
  brew update && brew upgrade
  upgrade_oh_my_zsh
  npm install -g npm && npm update -g
}

docker-deploy() {
  cd ./docker
  APP_ENV=local ./deploy.sh "$@"
  cd ..
}

git-commit-rebase-push() {
  git add .
  git commit -m "Auto commit! Should be squashed"
  git fetch --all
  git rebase $1
  git rebase -i $1
  git push -f
}

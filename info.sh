RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
BLU='\033[0;34m'
MAG='\033[0;35m'
CYN='\033[0;36m'
NOC='\033[0m'

printf "${RED}● ${RED}os: ${NOC}macOS\n"
printf "${GRN}● ${RED}terminal: ${NOC}iTerm\n"
printf "${YLW}● ${RED}multiplex: ${NOC}tmux\n"
printf "${BLU}● ${RED}shell: ${NOC}zsh\n"
printf "${MAG}● ${RED}editor: ${NOC}neovim\n"
printf "${CYN}● ${RED}uptime: ${NOC}$(uptime | awk '{print $3}') days\n"

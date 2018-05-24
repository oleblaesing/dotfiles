RED='\033[0;31m'
GRN='\033[0;32m'
YLW='\033[0;33m'
BLU='\033[0;34m'
MAG='\033[0;35m'
CYN='\033[0;36m'
NOC='\033[0m'

printf "${RED}os: ${NOC}macOS\t${RED}●\n"
printf "${RED}terminal: ${NOC}iTerm\t${GRN}●\n" 
printf "${RED}multiplex: ${NOC}tmux\t${YLW}●\n" 
printf "${RED}shell: ${NOC}zsh\t${BLU}●\n" 
printf "${RED}editor: ${NOC}neovim\t${MAG}●\n" 
printf "${RED}uptime: ${NOC}$(uptime | awk '{print $3}') days\t${CYN}●\n"

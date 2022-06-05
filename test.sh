#!/bin/bash
r='\033[0;31m' 
g='\033[0;32m' 
c='\033[0;36m' 
n='\033[0;97m'

bnr(){
echo -e "${g}████████╗███████╗░██████╗████████╗
╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝
░░░██║░░░█████╗░░╚█████╗░░░░██║░░░
░░░██║░░░██╔══╝░░░╚═══██╗░░░██║░░░
░░░██║░░░███████╗██████╔╝░░░██║░░░
░░░╚═╝░░░╚══════╝╚═════╝░░░░╚═╝░░░
        ${g}INTERNET SPEED TEST"
}
pkgs=( "python" "pip")
for pkg in "${pkgs[@]}";do    
    command -v $pkg >/dev/null 2>&1 || { echo -e >&2 "${g}$pkg ${n}: ${r}not installed... ${g} wait for install it" && apt-get install $pkg -y
    }
    done
pip install speedtest-cli
clear
bnr
ping -c 1 8.8.8.8 > /dev/null 2>&1
if [[ "$?" == 0 ]]; then
echo -e "${c}Your Internet Connection: ${g}ON ${n}"
read -p "Press enter for speed test" enter
echo -e "${g}"
speedtest --simple
echo -e "${n}"
read -p "Press enter for test again" enter
test.sh
else
echo -e "${c}Your Internet Connection: ${r}OFF ${n}or very slow"
exit
fi

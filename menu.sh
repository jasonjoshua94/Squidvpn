#!/bin/bash
Yellow='\e[0;33m'
green='\e[32m'
RED='\033[0;31m'
NC='\033[0m'
BGBLUE='\e[1;44m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0;37m'
# ==========================================
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/SandakanVPNTrickster/ip/main/access > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/SandakanVPNTrickster/ip/main/access | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/SandakanVPNTrickster/ip/main/access | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
PERMISSION

if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
echo -ne
else
red "Permission Denied!"
exit 0
fi
clear

figlet SQUIDVPN | lolcat
echo -e "$green PREMIUM SCRIPT"$NC
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                     [ VPN MENU ]                          ${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$green (•1) $NC SSH & OPENVPN         $$green (•4) $NC TROJAN "
echo -e "$green (•2) $NC VMESS & VLESS            $green (•5) $NC WIREGUARDS "
echo -e "$green (•3) $NC SS & SSR         $$green (•6) $NC L2TP, PPTP, SSTP "
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "${BGBLUE}                     [ OTHER MENU ]                          ${NC}"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e "$green (•7) $NC SYSTEM MENU         $green (•11) $NC INFO SCRIPT AUTO "
echo -e "$green (•8) $NC CHANGE PORT VPN            $green (•12) $NC CHECK USAGE "
echo -e "$green (•9) $NC REBOOT VPS         $green (•13) $NC CHECK RUNNING SC "
echo -e "$green (•10) $NC SERVER INFORMATION "
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e " PREMIUM SCRIPT VPS BY @SandakanVPNTrickster"
echo -e "${green}════════════════════════════════════════════════════════════${NC}"
echo -e   ""
echo -e "[Ctrl + C] For exit from main menu"
echo -e   ""
read -p "Select From Options [1-12 or x] :  " menu
echo -e ""
case $menu in
1)
menu-ssh
;;
2)
menu-v2ray
;;
3)
menu-ssr
;;
4)
menu-trojan
;;
5)
menu-wg
;;
6)
menu-pptp
;;
7)
system-menu
;;
8)
change-port
;;
9)
reboot
;;
10)
menu-server
;;
11)
about
;;
12)
ram
;;
13)
running
;;
x)
clear
exit
;;
*)
echo " Tolong masukkan nombor yang betul!!"
sleep 2 
menu
;;
esac
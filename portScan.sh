#!/bin/bash

# Control+C
trap ctrl_c INT

function ctrl_c(){
        echo -e "\n[-] Exiting..."
        tput cnorm; exit 1
}

# Main Port Scan

read -e -p "Insert the ip to scan: " ipaddress

for p in {1..65535}; 
        do(echo >/dev/tcp/$ipaddress/$p) >/dev/null 2>&1 && echo "[+] Port $p OPEN"; 
done

echo -e "\n[!] The scan has finished"

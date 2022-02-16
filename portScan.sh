#!/bin/bash

function ctrl_c(){
        echo -e "\n[-] Exiting..."
        tput cnorm; exit 1
}

# Control+C
trap ctrl_c INT

# Main Port Scan

ip=$1

if [[  $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        for port in $(seq 1 65535); do
                timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo "[+] Port $port -> OPEN" &
         done; wait
else
        echo -e "\n [!] Not a valid IP \n"
        exit 1
fi


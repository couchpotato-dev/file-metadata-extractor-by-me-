#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ -z "$1" ]; then
	echo -e "${RED}[!] Usuage: $0 <target>${NC}"
	echo -e "example: $0 192.168.1.1"
	exit 1
fi

TARGET=$1
echo -e "${YELLOW}[*] Pinging $TARGET at $(date)${NC}"

ping -c 3 $TARGET > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo -e "${GREEN}[+] $TARGET is Up${NC}"
else
	echo -e "${RED}[-] $TARGET is DOWN or unreachable${NC}"
fi

#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [ -z "$1" ]; then
    echo -e "${RED}[!] Usage: $0 <filename>${NC}"
    echo -e "    example: $0 photo.jpg"
    exit 1
fi

FILE=$1
STOREFILE="${FILE}_metadata.txt"

# check file actually exists before doing anything
if [ ! -f "$FILE" ]; then
    echo -e "${RED}[!] File not found: $FILE${NC}"
    exit 1
fi

echo -e "${YELLOW}[*] Checking metadata for: ${NC}\"$FILE\""
echo -e "${YELLOW}[*] Saving results to: ${NC}\"$STOREFILE\""

echo "STAT OUTPUT ======" > "$STOREFILE"
stat "$FILE" >> "$STOREFILE"
echo -e "\n" >> "$STOREFILE"

echo "LS OUTPUT ======" >> "$STOREFILE"
ls -la "$FILE" >> "$STOREFILE"
echo -e "\n" >> "$STOREFILE"

echo "FILE OUTPUT ======" >> "$STOREFILE"
file "$FILE" >> "$STOREFILE"
echo -e "\n" >> "$STOREFILE"

echo "EXIFTOOL OUTPUT ======" >> "$STOREFILE"
exiftool "$FILE" >> "$STOREFILE"
echo -e "\n" >> "$STOREFILE"

echo -e "${GREEN}[+] Done — results saved to $STOREFILE${NC}"

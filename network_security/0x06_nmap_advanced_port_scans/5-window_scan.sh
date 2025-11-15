#!/bin/bash
sudo nmap -sW -p -exclude-ports 25-28 20-30 "$1" "$2" "$3"
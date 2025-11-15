#!/bin/bash
sudo nmap --scanflags -p 80-90 "$1" "$2" -oN custom_scan.txt >/dev/null
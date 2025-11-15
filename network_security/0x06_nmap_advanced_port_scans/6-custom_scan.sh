#!/bin/bash
sudo nmap --scanflags -p 80-90 "$1" "$2" > custom_scan.txt
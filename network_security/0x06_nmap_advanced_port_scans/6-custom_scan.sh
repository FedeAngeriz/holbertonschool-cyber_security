#!/bin/bash
sudo nmap -sC -p 80-90 "$1" "$2" > custom_scan.txt
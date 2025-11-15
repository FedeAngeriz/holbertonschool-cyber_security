#!/bin/bash
sudo nmap -sW -p 20-30 "$1" "$2" "$3"
#!/bin/bash
sudo nmap -sA --reason -p 80,22,25 --host-timeout 1000ms "$1" "$2"
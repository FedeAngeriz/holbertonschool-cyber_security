#!/bin/bash
sudo nmap -sA -p 80,22,25 --open --packet-trace -T1 "$1"
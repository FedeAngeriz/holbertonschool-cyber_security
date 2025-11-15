#!/bin/bash
sudo nmap -sM -p http,https,ftp,ssh,telnet --reason "$1"
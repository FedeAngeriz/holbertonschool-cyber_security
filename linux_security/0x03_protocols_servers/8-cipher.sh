#!/bin/bash
nmap --script ssl-enum-ciphers -p 443 "$2" "$1"
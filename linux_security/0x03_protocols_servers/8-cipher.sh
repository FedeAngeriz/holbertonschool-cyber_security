#!/bin/bash
nmap --script ssl-enum-ciphers -p "$2" "$1"
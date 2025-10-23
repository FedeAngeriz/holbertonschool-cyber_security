#!/bin/bash
hashcat --stdout -a "$1" "$2" > combined_wordlist.txt
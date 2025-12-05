#!/bin/bash
grep -i "Acepted password for" auth.log | awk '{print $9}' | sort -u
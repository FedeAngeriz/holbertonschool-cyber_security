#!/bin/bash
grep -i "Accepted password for" auth.log | awk '{print $9}' | sort -u
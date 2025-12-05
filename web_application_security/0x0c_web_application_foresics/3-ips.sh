#!/bin/bash
grep -i "Accepted password for" auth.log | awk '{print $11}' | sort -u
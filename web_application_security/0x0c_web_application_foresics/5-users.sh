#!/bin/bash
grep -Ei "useradd|new user|added user" auth.log | sed -E 's/.*name=([A-Za-z0-9_-]+).*/\1/' | sort -u | paste -sd ','
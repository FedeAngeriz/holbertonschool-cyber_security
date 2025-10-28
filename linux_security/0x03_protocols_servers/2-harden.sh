#!/bin/bash
find / -xdev -type d -perm -0002 -o+w -print 2>/dev/null
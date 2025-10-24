#!/bin/bash
find "$1" -type f -perm -4000 -excec -print 2>/dev/null
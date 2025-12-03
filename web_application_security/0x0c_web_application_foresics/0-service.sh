#!/bin/bash
grep -ri "ssh|sshd" /var/log/ > /dev/null && echo "sshd"
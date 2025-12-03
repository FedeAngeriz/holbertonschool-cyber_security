#!/bin/bash
grep -ri "sshd" /var/log/ > /dev/null && echo "sshd"
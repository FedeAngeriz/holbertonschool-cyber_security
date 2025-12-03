#!/bin/bash
grep -ri "sshd" /var/log/auth.log > /dev/null && echo "sshd"
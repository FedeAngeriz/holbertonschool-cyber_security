#!/bin/bash
grep -q "STARTTLS" /etc/postfix/main.cf || echo "STARTTLS not configured"
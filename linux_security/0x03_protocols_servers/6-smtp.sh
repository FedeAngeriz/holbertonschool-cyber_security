#!/bin/bash
grep ^smtpd_tls_security_level -q "STARTTLS" /etc/postfix/main.cf || echo "STARTTLS not configured"
#!/bin/bash
grep -E "iptables -A" auth.log | wc -l
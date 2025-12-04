#!/bin/bash
grep -ie "iptables .* -A" auth.log | wc -l
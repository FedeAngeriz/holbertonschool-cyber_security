#!/bin/bash
grep -E "iptables .* (-A|-I)" auth.log | wc -l
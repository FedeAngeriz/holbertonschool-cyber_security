#!/bin/bash
grep -ie "iptables .* (-A|-I)" auth.log | wc -l
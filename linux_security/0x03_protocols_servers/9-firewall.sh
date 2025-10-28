#!/bin/bash
iptables -P INPUT DROP
iptables -P INPUT -p tcp --dport 22 -j ACCEPT
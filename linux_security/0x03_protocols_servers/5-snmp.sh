#!/bin/bash
grep public snmpwalk -v2c -c public "$1"
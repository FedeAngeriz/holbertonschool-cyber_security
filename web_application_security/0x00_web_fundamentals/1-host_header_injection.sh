#!/bin/bash
curl -v -H "Host: $1" "$2" -d "$3"

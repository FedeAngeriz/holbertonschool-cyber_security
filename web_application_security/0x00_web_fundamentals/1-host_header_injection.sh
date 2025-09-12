#!/bin/bash
curl -X -H "Host: $1" "$2" -d "$3"

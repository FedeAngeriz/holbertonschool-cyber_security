#!/bin/bash
# 1-xor_decoder.sh
# Uso: ./1-xor_decoder.sh '{xor}BASE64_STRING'

if [ $# -ne 1 ]; then
    echo "Uso: $0 {xor}BASE64_STRING"
    exit 1
fi

# Quita el prefijo {xor} si existe
input="${1#\{xor\}}"

# Clave XOR
key=0x5F

# Decodificar base64 a bytes decimales
decoded=$(echo "$input" | base64 --decode | od -An -t u1 -v)

# Recorremos cada byte y aplicamos XOR
for byte in $decoded; do
    printf "\\$(printf '%03o' $((byte ^ key)))"
done

echo

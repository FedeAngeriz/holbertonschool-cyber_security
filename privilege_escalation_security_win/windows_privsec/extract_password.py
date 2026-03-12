import base64

encoded = "U3VwM2VyU2VjcmV0UGFzczRBRG0xbg=="
decoded = base64.b64decode(encoded)

print(decoded)
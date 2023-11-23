#Generating private key in PKCS1
openssl genrsa -out ./keys/private.pem 2048

#Generating public key
openssl rsa -in ./keys/private.pem -pubout -outform PEM -out ./keys/public_key.pem

#Generating private key in PKCS8
openssl pkcs8 -topk8 -inform PEM -in ./keys/private.pem -out ./keys/private_key.pem -nocrypt

#Generating symetric key
openssl rand -out ./keys/key -hex 16

#Generating iv
openssl rand -out ./keys/iv -hex 8

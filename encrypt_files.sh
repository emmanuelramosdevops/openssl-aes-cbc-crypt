#Encrypt file using key and iv
openssl aes-256-cbc -in file.csv -out ./encrypted/file.csv.enc -K dc03c63bf54b4a0cd38778761e710a -iv 70012343fbcef8

#Encrypt key and iv with pub key
openssl rsautl -encrypt -inkey ./keys/public_key.pem -pubin -in ./keys/key -out ./encrypted/key.enc 
openssl rsautl -encrypt -inkey ./keys/public_key.pem -pubin -in ./keys/iv  -out ./encrypted/iv.enc 

#Encode file, key and iv to B64
openssl base64 -in ./encrypted/file.csv.enc -out ./encoded/file.csv.enc.b64
openssl base64 -in ./encrypted/key.enc      -out ./encoded/key.enc.b64
openssl base64 -in ./encrypted/iv.enc       -out ./encoded/iv.enc.b64

#Copying base64 to input 
cp ./encoded/file.csv.enc.b64 ./input/20190412110602643109_2019.csv
cp ./encoded/key.enc.b64   ./input/20190412110602643109_2019.key
cp ./encoded/iv.enc.b64       ./input/20190412110602643109_2019.iv

#Decode file, key and iv from B64
openssl base64 -d -in ./encoded/file.csv.enc.b64 -out ./decoded/file.csv.enc
openssl base64 -d -in ./encoded/key.enc.b64      -out ./decoded/key.enc
openssl base64 -d -in ./encoded/iv.enc.b64       -out ./decoded/iv.enc

#Decrypt key and iv using priv key
openssl rsautl -decrypt -inkey ./keys/private_key.pem -in ./decoded/key.enc -out ./decrypted/key.dec
openssl rsautl -decrypt -inkey ./keys/private_key.pem -in ./decoded/iv.enc  -out ./decrypted/iv.dec

#Decrypt file using decripted key and iv
openssl enc -d -aes-256-cbc -in ./decoded/file.csv.enc -out ./decrypted/file.csv.dec -K dc03c63bf54b4a0cd38778761e710a -iv 70012343fbcef8





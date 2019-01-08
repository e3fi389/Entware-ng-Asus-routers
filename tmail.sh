#!/bin/sh

SMTP="smtp.gmail.com:587"
FROM="example.from@gmail.com"
TO="example.to@gmail.com"
USER="gmail_username"
PASS="gmail_password"
FROMNAME="Asus Router"
torrent_name="$TR_TORRENT_NAME"

echo "Subject: Download notification!" >/tmp/tmail.txt
echo "From: "$FROMNAME"<$FROM>" >>/tmp/tmail.txt
echo "Date: `date -R`" >>/tmp/tmail.txt
echo "" >>/tmp/tmail.txt
echo Transmissionbt has finished downloading "$TR_TORRENT_NAME" on `date +%d/%m/%Y` at `date +%T` >>/tmp/tmail.txt
echo "" >>/tmp/tmail.txt
echo "Your friendly router." >>/tmp/tmail.txt
echo "" >>/tmp/tmail.txt

cat /tmp/tmail.txt | sendmail -H"exec openssl s_client -quiet -CAfile /jffs/configs/Equifax_Secure_Certificate_Authority.pem -connect smtp.gmail.com:587 -tls1 -starttls smtp" -f"$FROM" -au"$USER" -ap"$PASS" $TO
rm /tmp/tmail.txt
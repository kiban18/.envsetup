#!/bin/bash

DEBUG=true
#DEBUG=false

SRCNAME=$1
DSTNAME=$2
SRCKEYSTORE=${SRCNAME}.keystore
DSTKEYSTORE=${DSTNAME}.keystore

if [[ -z "$SRCNAME" || -z "$DSTNAME" ]]; then
    echo "Usage : makekey.sh <SRCNAME> <DSTNAME>"
    echo "    ex) makekey.sh platform debug"
    exit 1
fi

openssl pkcs8 -inform DER -nocrypt -in ${SRCNAME}.pk8 -out ${SRCNAME}.pem
openssl pkcs12 -export -in ${SRCNAME}.x509.pem -inkey ${SRCNAME}.pem -out ${SRCNAME}.p12 -password pass:android -name androiddebugkey
keytool -importkeystore -deststorepass android -destkeystore ${DSTNAME}.keystore -srckeystore ${SRCNAME}.p12 -srcstoretype PKCS12 -srcstorepass android
#keytool -list -v -keystore ${DSTNAME}.keystore


exit 0

#!/bin/bash

#DEBUG=true
DEBUG=false

SEARCH_NAME=LOCAL_MODULE
LIBRARY_NAME=$1
if [[ "$LIBRARY_NAME" == "" ]]; then
  echo "Usage : findlib <LIBRARY_NAME>"
  echo "    ex) findlib libstagefright"
  exit 1
fi

find . -name Android.mk | xargs grep "\<$LIBRARY_NAME\>" | grep $SEARCH_NAME
if [ $? == 0 ]; then
  ANDROID_MK=`find . -name Android.mk | xargs grep "\<$LIBRARY_NAME\>" | grep $SEARCH_NAME | sed "s/Android.mk.*/Android.mk/"`
  vim +/$SEARCH_NAME $ANDROID_MK
fi

exit 1

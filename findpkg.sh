#!/bin/bash

#DEBUG=true
DEBUG=false

SEARCH_NAME=LOCAL_PACKAGE_NAME
PACKAGE_NAME=$1
if [[ "$PACKAGE_NAME" == "" ]]; then
  echo "Usage : findpkg <PACKAGE_NAME>"
  echo "    ex) findpkg TestDeviceSetup"
  exit 1
fi

find . -name Android.mk | xargs grep "\<$PACKAGE_NAME\>" | grep $SEARCH_NAME
if [ $? == 0 ]; then
  ANDROID_MK=`find . -name Android.mk | xargs grep "\<$PACKAGE_NAME\>" | grep $SEARCH_NAME | sed "s/Android.mk.*/Android.mk/"`
  vim +/$SEARCH_NAME $ANDROID_MK
fi

exit 1

#!/bin/bash

DEBUG=true
#DEBUG=false

REPO_INIT_CMD="repo init -u"
## check if the file 'default.xml' exists or not ##
REMOTE_FETCH_URL=`find .repo -name "default.xml" | xargs grep "fetch" | grep "29418" | sed "s/.*fetch=\"//" | sed "s/\/\"//"`
DEFAULT_REVISION=`find .repo -name "default.xml" | xargs grep "default revision" | sed "s/.*revision=\"//" | sed "s/\"//"`

echo $REPO_INIT_CMD $REMOTE_FETCH_URL/platform/manifest.git -b $DEFAULT_REVISION

exit 0

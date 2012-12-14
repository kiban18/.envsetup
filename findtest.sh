#!/bin/bash

#DEBUG=true
DEBUG=false

SEARCH_NAME="<test"
TESTDEF_NAME=$1
if [[ "$TESTDEF_NAME" == "" ]]; then
  echo "Usage : findtest <TESTDEF>"
  echo "    ex) findtest cts-tv"
  exit 1
fi

find . -name test_defs.xml | xargs grep "\<$TESTDEF_NAME\>" | grep $SEARCH_NAME | grep -v out
if [ $? == 0 ]; then
  TESTDEFS_XML=`find . -name test_defs.xml | xargs grep "\<$TESTDEF_NAME\>" | grep $SEARCH_NAME | grep -v out | sed "s/test_defs.xml.*/test_defs.xml/"`
  vim +/"test .*$TESTDEF_NAME" $TESTDEFS_XML
fi

exit 1

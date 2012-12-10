#!/bin/bash

DEBUG=true
#DEBUG=false

CSCOPE_FILES=cscope.files
CSCOPE_OUT=cscope.out

rm -rf $CSCOPE_FILES $CSCOPE_OUT
find . \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -name '*.java' -o -name '*.aidl' \) -print > $CSCOPE_FILES
cscope -b

exit 0

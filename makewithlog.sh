#!/bin/bash

DEBUG=false
if [[ "$1" == "-V" ]]; then
    DEBUG=true
fi

LOGFILE=make_$TARGET_PRODUCT-$TARGET_BUILD_VARIANT-`date +'%y.%m.%d_%H%M%S'`.log

time make -j8 2>&1 | tee $LOGFILE
grep "오류" $LOGFILE
if [[ $? == 0 ]]; then
    echo "    Can't keep building!!!"
    exit 1
fi
grep "^[0-9][0-9]* error" $LOGFILE
if [[ $? == 0 ]]; then
    echo "    Can't keep building!!!"
    exit 1
fi
ls -al $OUT/system.img | grep $OUT/system.img

exit 0

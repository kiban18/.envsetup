#!/bin/bash

DEBUG=false
if [[ "$1" == "-V" ]]; then
    DEBUG=true
fi

LOGFILE=make_$TARGET_PRODUCT-$TARGET_BUILD_VARIANT-otapackage_`date +'%y.%m.%d_%H%M%S'`.log

time make otapackage -j8 2>&1 | tee $LOGFILE
grep "^[0-9][0-9]* error" $LOGFILE # need to verify
if [[ $? == 0 ]]; then
    echo "    Can't keep building!!!"
    exit 1
fi

if [[ "$TARGET_BUILD_TYPE" == "debug" ]]; then
    OTA_ZIP=$OUT/${TARGET_PRODUCT}_$TARGET_BUILD_TYPE-ota-$TARGET_BUILD_VARIANT.$USER.zip
else
    OTA_ZIP=$OUT/$TARGET_PRODUCT-ota-$TARGET_BUILD_VARIANT.$USER.zip
fi
ls -al $OTA_ZIP | grep $OTA_ZIP

exit $?

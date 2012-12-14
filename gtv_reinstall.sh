#!/bin/bash

DEBUG=false
if [[ "$1" == "-V" ]]; then
    DEBUG=true
fi

if [[ "$TARGET_BUILD_TYPE" == "debug" ]]; then
    OTA_ZIP=$OUT/${TARGET_PRODUCT}_$TARGET_BUILD_TYPE-ota-$TARGET_BUILD_VARIANT.$USER.zip
else
    OTA_ZIP=$OUT/$TARGET_PRODUCT-ota-$TARGET_BUILD_VARIANT.$USER.zip
fi
$ADBCON_SH && vendor/tv/tools/gtv_reinstall.sh -f $OTA_ZIP $ADBHOST

exit $?

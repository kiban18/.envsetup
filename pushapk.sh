#!/bin/bash

DEBUG=true
#DEBUG=false

if [[ -z "$ADBHOST" || -z "$OUT" ]]; then
    echo ADBHOST or OUT is not defined. exiting...
    exit 2
fi

$ADBCON_SH && adb -s $ADBHOSTPORT remount


#declare -A apks
apks=`grep "Install: out.*.apk" make_mm_build.log`

#echo $apks
array="$apks"
if [[ "$DEBUG" == "true" ]]; then
    echo "array:$array"
fi

while [[ -n "$array" ]]
do
    apk=${array%%.apk*}
    if [[ "$DEBUG" == "true" ]]; then
        echo "apk=\${array%%.apk*}:$apk"
    fi
    apk=${apk#*$TARGET_PRODUCT}.apk
    if [[ "$DEBUG" == "true" ]]; then
        echo "apk=\${apk#*$TARGET_PRODUCT}.apk:$apk"
    fi
    echo ""
    echo "Install $apk"
    echo "adb -s $ADBHOSTPORT push $OUT/$apk $apk"
    adb -s $ADBHOSTPORT push $OUT/$apk $apk
    adb -s $ADBHOSTPORT shell "sync; sync"
    ls -al $OUT/$apk
    adb -s $ADBHOSTPORT shell ls -al $apk
    array=${array#*.apk}
    if [[ "$DEBUG" == "true" ]]; then
        echo "array=\${array#*.apk}:$array"
    fi
done

echo ""

exit 0

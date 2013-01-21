#!/bin/bash

DEBUG=true
#DEBUG=false

if [[ -z "$ADBHOST" || -z "$OUT" ]]; then
    echo ADBHOST or OUT is not defined. exiting...
    exit 2
fi

$ADBCON_SH && adb -s $ADBHOSTPORT remount


#declare -A jars
jars=`grep "Install: out.*.jar" make_mm_build.log`

#echo $jars
array="$jars"
if [[ "$DEBUG" == "true" ]]; then
    echo "array:$array"
fi

while [[ -n "$array" ]]
do
    jar=${array%%.jar*}
    if [[ "$DEBUG" == "true" ]]; then
        echo "jar=\${array%%.jar*}:$jar"
    fi
    jar=${jar#*$TARGET_PRODUCT}.jar
    if [[ "$DEBUG" == "true" ]]; then
        echo "jar=\${jar#*$TARGET_PRODUCT}.jar:$jar"
    fi
    echo ""
    echo "Install $jar"
    echo "adb -s $ADBHOSTPORT push $OUT/$jar $jar"
    adb -s $ADBHOSTPORT push $OUT/$jar $jar
    adb -s $ADBHOSTPORT shell "sync; sync"
    ls -al $OUT/$jar
    adb -s $ADBHOSTPORT shell ls -al $jar
    array=${array#*.jar}
    if [[ "$DEBUG" == "true" ]]; then
        echo "array=\${array#*.jar}:$array"
    fi
done

echo ""

exit 0

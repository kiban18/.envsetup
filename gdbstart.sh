#!/bin/bash

DEBUG=true
#DEBUG=false

DEBUG_PACKAGE=$1
DEBUG_PORT=$2

if [[ -z "$DEBUG_PACKAGE" || -z "$DEBUG_PORT" ]]; then
    echo "Usage : gdbattach <DEBUG_PACKAGE> <DEBUG_PORT>"
    echo "    ex) gdbattach com.google.tv.mediadevicesapp 10000"
    exit 1
fi

#if [[ -z "$ADBHOST" ]]; then
#    echo "ADBHOST is not defined. exiting..."
#    exit 2
#fi
#
#adbcon.sh # adb connect if disconnected!!

#echo "adb -s $ADBHOSTPORT forward tcp:$DEBUG_PORT tcp:$DEBUG_PORT"
#adb -s $ADBHOSTPORT forward tcp:$DEBUG_PORT tcp:$DEBUG_PORT
echo "adb forward tcp:$DEBUG_PORT tcp:$DEBUG_PORT"
adb forward tcp:$DEBUG_PORT tcp:$DEBUG_PORT

echo "adb shell gdbserver :$DEBUG_PORT $DEBUG_PACKAGE"
echo ""
adb shell gdbserver :$DEBUG_PORT $DEBUGA_PACKAGE

exit 0

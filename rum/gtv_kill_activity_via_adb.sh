#!/bin/bash

PACKAGE=$1

adb shell ps | grep ${PACKAGE}

PSID=`adb shell ps | grep ${PACKAGE} | awk {'print $1'}`
adb shell kill ${PSID}

#!/bin/bash

TARGET_BOARD=192.168.10.30
EXPECT_SCRIPT=envsetup/gtv_logcat_via_telnet.exp

SUCCESS=0

trap 'echo; echo script exit; exit' 2

while :
do
ping -c5 ${TARGET_BOARD} 1>/dev/null
RESULT=$?
if [ ${RESULT} == ${SUCCESS} ]; then
    echo "expect ${EXPECT_SCRIPT} ${TARGET_BOARD}"
    expect ${EXPECT_SCRIPT} ${TARGET_BOARD}
fi
echo "waiting ${TARGET_BOARD} connection..."
done

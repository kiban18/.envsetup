#!/bin/bash

RUM_HOME=~/rum/home
MNT_SCRIPT=envsetup/gtv_mount_rumserver_my_home.sh

HAS_MOUNTED=`mount | grep rum/home`
if [ "${HAS_MOUNTED}" ]; then
	echo "fusermount -u ${RUM_HOME}"
	fusermount -u ${RUM_HOME}
fi

echo ". ${MNT_SCRIPT}"
. ${MNT_SCRIPT}

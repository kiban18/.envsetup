#!/bin/bash

RUM_HOME=/home/kiban18/rum/home
GTV_SCRIPT=.envsetup/gtv_v2_setup.sh

HAS_MOUNTED=`mount | grep rum/home`
if [ "${HAS_MOUNTED}" ]; then
	echo "${RUM_HOME} already mounted!!!"
else
	echo "mount ${RUM_HOME}"
	mount ${RUM_HOME}
fi

if [ -f ${RUM_HOME}/${GTV_SCRIPT} ]; then
	cd ${RUM_HOME}
	echo ". ${GTV_SCRIPT}"
	. ${GTV_SCRIPT}
else
	echo "mount failed!!! ask to server's administrator..."
fi

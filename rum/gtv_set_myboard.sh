#!/bin/bash

MAC_ADDR="FE:1A:BF:B6:1B:82"
IP_ADDR="192.168.1.177"
NFS_SYSTEM_DIR="/home/kiban18/SamsungGoogleTV/nfs/system"
NFS_DATA_DIR="/home/kiban18/SamsungGoogleTV/nfs/data"


trap 'echo; echo script exit; exit' 2

DEBUG=true
PROGRAM=$0
ZIP_DIR=$1
if [ "$ZIP_DIR" == "" ]; then
    echo "usage $PROGRAM (path of updateEP_rNN.zip)"
    echo "example"
    echo "    $PROGRAM 20120224"
    exit
fi

REMARK="#"
TAB="	"
SLASH="\/"
LINEFEED=""

NETMASK="255.255.252.0"
ROUTE_ADDR="192.168.0.0${SLASH}24"
GATEWAY="192.168.0.1"
RUM_ADDR="192.168.1.30"

UPDATE_ZIP="updateEP.zip"
UPDATE_XXX_ZIP="updateEP_xxx.zip"

ROOTFS_IMG="rootfs.img"
SQUASHFS_ROOT="squashfs-root"
RCS_FILE="${SQUASHFS_ROOT}/etc/rcS"
IFCONFIG_ETH0_HW_ETHER_CMD="ifconfig eth0 hw ether ${MAC_ADDR}"
IFCONFIG_ETH0_NETMASK_CMD="ifconfig eth0 ${IP_ADDR} netmask ${NETMASK}"
ROUTE_ADD_NET_GW_CMD="route add -net ${ROUTE_ADDR} gw ${GATEWAY}"
MOUNT_FOR_SYSTEM_CMD="${TAB}mount -t nfs -o tcp,nolock ${RUM_ADDR}:${NFS_SYSTEM_DIR//${SLASH}/${SLASH}} ${SLASH}system"
MOUNT_FOR_DATA_CMD="${TAB}mount -t nfs -o tcp,nolock ${RUM_ADDR}:${NFS_DATA_DIR//${SLASH}/${SLASH}} ${SLASH}data"


function unzip_updateEP()
{
echo "########################################################"
echo "unzip_updateEP()"
echo "########################################################"
pushd ${ZIP_DIR}
list=(`ls updateEP*.zip`)
UPDATE_ZIP=${list[0]}
UPDATE_ZIP_DIR=${UPDATE_ZIP%.zip}
UPDATE_XXX_ZIP=${list[1]}
UPDATE_XXX_ZIP_DIR=${UPDATE_XXX_ZIP%.zip}
WORKING_DIR=${PWD}/${UPDATE_XXX_ZIP_DIR}
if [ -d ${UPDATE_ZIP_DIR} ]; then
	sudo rm -rf ${UPDATE_ZIP_DIR}
fi
if [ -d ${UPDATE_XXX_ZIP_DIR} ]; then
	sudo rm -rf ${UPDATE_XXX_ZIP_DIR}
fi
sudo unzip ${UPDATE_ZIP} -d ${UPDATE_ZIP_DIR}
sudo unzip ${UPDATE_XXX_ZIP} -d ${UPDATE_XXX_ZIP_DIR}
popd
}

function setup()
{
echo "########################################################"
echo "setup()"
echo "########################################################"
if [ "${DEBUG}" == "true" ]; then
    sudo rm -rf ${SQUASHFS_ROOT}
	if [ -f ${ROOTFS_IMG}.org ]; then
		sudo rm -rf ${ROOTFS_IMG}
		sudo mv -f ${ROOTFS_IMG}.org ${ROOTFS_IMG}
	fi
fi
}

function teardown()
{
echo "########################################################"
echo "teardown()"
echo "########################################################"
}

function unsquashfs()
{
echo "########################################################"
echo "unsquashfs()"
echo "########################################################"
if [ -d ${SQUASHFS_ROOT} ]; then
    sudo mv ${SQUASHFS_ROOT} ${SQUASHFS_ROOT}.bak
fi
if [ ! -f ${ROOTFS_IMG} ]; then
    sudo mv ${ROOTFS_IMG}.org ${ROOTFS_IMG}
fi
sudo unsquashfs ${ROOTFS_IMG}
sudo mv ${ROOTFS_IMG} ${ROOTFS_IMG}.org
}

function mksquashfs()
{
echo "########################################################"
echo "mksquashfs()"
echo "########################################################"
sudo mksquashfs ${SQUASHFS_ROOT} ${ROOTFS_IMG}
sudo chmod 777 ${ROOTFS_IMG}
}

function modify_rcS()
{
echo "########################################################"
echo "modify_rcS()"
echo "########################################################"
sudo cp ${RCS_FILE} ${RCS_FILE}.org
sudo chmod 777 ${RCS_FILE}
ex ${RCS_FILE} << [EOF]
1
%s/^USE_LOCALMOUNT=.*$/${REMARK} &/g
%s/^ifconfig eth0 hw .*/${REMARK} &${LINEFEED}${IFCONFIG_ETH0_HW_ETHER_CMD}/g
%s/^ifconfig eth0 .*netmask .*/${REMARK} &${LINEFEED}${IFCONFIG_ETH0_NETMASK_CMD}/g
%s/^route add -net .*gw .*/${REMARK} &${LINEFEED}${ROUTE_ADD_NET_GW_CMD}/g
%s/^route add default gw .*/${REMARK} &/g
%s/mount .*nfs .*system/${REMARK} &${LINEFEED}${MOUNT_FOR_SYSTEM_CMD}/g
%s/mount .*nfs .*data/${REMARK} &${LINEFEED}${MOUNT_FOR_DATA_CMD}/g
wq!
[EOF]
}


unzip_updateEP

echo "pushd ${WORKING_DIR}"
pushd ${WORKING_DIR}
setup
unsquashfs
modify_rcS
mksquashfs
teardown
echo "popd"
popd

exit

#!/bin/bash

DEBUG=false
if [[ "$1" == "-V" ]]; then
    DEBUG=true
fi

makewithlog.sh
if [[ $? != 0 ]]; then
    echo "ERROR with makewithlog.sh"
    exit 1
fi

makeotawithlog.sh
if [[ $? != 0 ]]; then
    echo "ERROR with makeotawithlog.sh"
    exit 1
fi

gtv_reinstall.sh
if [[ $? != 0 ]]; then
    echo "ERROR with gtv_reinstall.sh"
    exit 1
fi

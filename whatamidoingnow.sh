#!/bin/bash

DEBUG=false
if [[ "$1" == "-V" ]]; then
    DEBUG=true
fi

CURR=$PWD
WHAT="repo branches"

if [[ "$DEBUG" == "true" ]]; then
    echo "CURR:$CURR"
fi
case $CURR in
    *"googletv"*) ISGOOGLETVDIR="yes";;
    *) ISGOOGLETVDIR="no";;
esac

if [[ "$ISGOOGLETVDIR" == "yes" ]]; then
    FROMROOT=${CURR#*googletv/}
    if [[ "$DEBUG" == "true" ]]; then
        echo "FROMROOT=\${CURR#*googletv/}:$FROMROOT"
    fi
    ROOT=${FROMROOT%%/*}
    if [[ "$DEBUG" == "true" ]]; then
        echo "ROOT=\${FROMROOT%%/*}:$ROOT"
    fi
    if [[ "$DEBUG" == "true" ]]; then
        echo ""
    fi
    
    if [[ "$DEBUG" == "true" ]]; then
        pushd $GOOGLETVDIR/$ROOT
    else
        pushd $GOOGLETVDIR/$ROOT > /dev/null
    fi
    $WHAT
    if [[ "$DEBUG" == "true" ]]; then
        popd
    else
        popd > /dev/null
    fi
else
    echo "you are not in googletv"
fi

exit 0

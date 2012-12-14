#!/bin/bash

#DEBUG=true
DEBUG=false

if [[ -z "$ADBHOST" ]]; then
    echo ADBHOST is not defined. exiting...
    exit 2
fi

COMPONENT=$1
if [[ "$COMPONENT" == "" ]]; then
  echo "Usage : killprocess <COMPONENT>"
  echo "    ex) killprocess com.google.tv.launcher"
  exit 1
fi

shift

if [[ "$DEBUG" == "true" ]]; then
    echo "COMPONENT: $COMPONENT"
fi

ADBSHELL="adb -s $ADBHOST:5555 shell"
ADBSHELL_PS="$ADBSHELL ps"
ADBSHELL_KILL="$ADBSHELL kill"

if [[ "$DEBUG" == "true" ]]; then
    echo ""
    echo "$ADBSHELL_PS"
    $ADBSHELL_PS
    echo ""
    echo "$ADBSHELL_PS | grep $COMPONENT"
    $ADBSHELL_PS | grep $COMPONENT
    echo ""
    echo "$ADBSHELL_PS | grep $COMPONENT | awk '{print \$2}'"
    $ADBSHELL_PS | grep $COMPONENT | awk '{print $2}'
    echo ""
    echo "$ADBSHELL_PS | grep $COMPONENT | awk '{print \$2}' | xargs $ADBSHELL_KILL"
fi
echo PID is $ADBSHELL_PS | grep $COMPONENT | awk '{print $2}'
$ADBSHELL_PS | grep $COMPONENT | awk '{print $2}' | xargs $ADBSHELL_KILL

exit 0

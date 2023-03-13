#!/bin/bash

VPN=$1

if [ -z "$VPN" ]
then
    exit 1
fi

ACTIVE=$(nmcli con show --active | grep "$VPN")

if [ -z "$ACTIVE" ]
then
    echo ""
else
    echo ""
fi

exit 0

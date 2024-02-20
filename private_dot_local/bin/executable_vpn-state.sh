#!/bin/bash

VPN=$1

if [ -z "$VPN" ]
then
    exit 1
fi

ACTIVE=$(nmcli con show --active | grep "$VPN")
IP=$(nmcli con show "$VPN"| rg "IP4.ADDRESS" | tr -d " " | rg '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' -o)

if [ -z "$ACTIVE" ]
then
    echo "{\"text\": \"\", \"tooltip\": \"not connected\"}"
else
    echo "{\"text\": \"\", \"tooltip\": \"IP: $IP\"}"
fi

exit 0

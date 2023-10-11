#!/bin/bash

VPN=$1

if [ -z "$VPN" ]
then
    exit 1
fi

ACTIVE=$(nmcli con show --active | grep "$VPN")

if [ -z "$ACTIVE" ]
then
    notify-send -t 5000 "VPN Toggle" "Activated $VPN"
    nmcli con up id "$VPN"
    sleep 4
    ~/.local/bin/whatsapp_routing_over_home_network.sh
else
    notify-send -t 5000 "VPN Toggle" "Deactivated $VPN"
    nmcli con down id "$VPN"
    sleep 4
    ~/.local/bin/whatsapp_routing_over_home_network.sh delete
fi

exit 0

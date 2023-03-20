#!/bin/bash

HS_MODE=$1

if [ -z "$HS_MODE" ]
then
    echo "$0 needs an argument."
    echo "possible options:"
    echo
    echo "headset-head-unit-msbc or a2dp-sink-aac"
    exit 1
fi

pactl set-card-profile bluez_card.60_AB_D2_41_CD_11 "$HS_MODE"

exit 0

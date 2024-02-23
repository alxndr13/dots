#!/bin/bash

string=""
tooltipstring=""
headsetpercentage=""
mousepercentage=""
if [[ $(bluetoothctl show | grep Powered | tr -d '\t' | cut -d " " -f 2) = "yes" ]]; then
  string="󰤁"
  if bluetoothctl info 60:AB:D2:41:CD:11 | grep Connected | tr -d '[:space:]'| cut -d":" -f 2 | grep yes > /dev/null 2>&1; then
    headsetpercentage=$(bluetoothctl info 60:AB:D2:41:CD:11 | rg Battery | rg  "\((?P<percentage>\d{2,3})\)" -or "\$1")
    string="$string -  🎧"
    tooltipstring=" 🎧 ($headsetpercentage%)"$'\n'
  fi
  if bluetoothctl info DC:54:35:A3:35:EB | grep Connected | tr -d '[:space:]'| cut -d":" -f 2 | grep yes > /dev/null 2>&1; then
    mousepercentage=$(bluetoothctl info DC:54:35:A3:35:EB | rg Battery | rg  "\((?P<percentage>\d{2,3})\)" -or "\$1")
    string="$string -  🐭"
    tooltipstring="$tooltipstring 🐭 ($mousepercentage%)"
  fi


  jo text="$string" tooltip="$tooltipstring"
else
  jo text="󰤂"
fi

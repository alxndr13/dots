#!/bin/bash

string=""
if [[ $(bluetoothctl show | grep Powered | tr -d '\t' | cut -d " " -f 2) = "yes" ]]; then
  string="󰤁"
  if bluetoothctl info 60:AB:D2:41:CD:11 | grep Connected | tr -d '[:space:]'| cut -d":" -f 2 | grep yes > /dev/null 2>&1; then
    headsetpercentage=$(bluetoothctl info 60:AB:D2:41:CD:11 | rg Battery | rg  "\((?P<percentage>\d{2})\)" -or "\$1")
    string="$string -  🎧 ($headsetpercentage%)"
  fi
  if bluetoothctl info DC:54:35:A3:35:EB | grep Connected | tr -d '[:space:]'| cut -d":" -f 2 | grep yes > /dev/null 2>&1; then
    percentage=$(bluetoothctl info DC:54:35:A3:35:EB | rg Battery | rg  "\((?P<percentage>\d{2})\)" -or "\$1")
    string="$string -  🐭 ($percentage%)"
  fi
  echo $string
else
  echo "󰤂"
fi

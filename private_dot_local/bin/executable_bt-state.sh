#!/bin/bash
if [[ $(bluetoothctl show | grep Powered | tr -d '\t' | cut -d " " -f 2) = "yes" ]]; then
  string="ON"
  if bluetoothctl info 60:AB:D2:41:CD:11 | grep Connected | tr -d '[:space:]'| cut -d":" -f 2 | grep yes > /dev/null 2>&1; then
    string="$string -  Delta"
  fi
  if bluetoothctl info DA:E8:97:89:F2:96 | grep Connected | tr -d '[:space:]'| cut -d":" -f 2 | grep yes > /dev/null 2>&1; then
    string="$string -  MX Keys Mini"
  fi
  echo "$string"
else
  echo "OFF"
fi

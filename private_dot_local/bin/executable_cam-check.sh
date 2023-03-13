#!/bin/bash

set -e

processCount=$(lsmod | grep uvcvideo | head -1 | awk '{print $3}')

if [ "$processCount" -eq "2" ]; then
  echo "OFF"
fi
echo "ON"

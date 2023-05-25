#!/bin/bash

if [ -z "$1" ]; then
  echo "first argument must be the device"
  exit 1
fi


sudo resolvectl dns "$1" 10.1.13.53
sudo resolvectl domain "$1" marksys.de

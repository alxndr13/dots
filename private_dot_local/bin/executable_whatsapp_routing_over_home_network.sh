#!/bin/bash

set -e


primaryIP=$(ip -j a show dev enp7s0f3u1u2 primary  | jq -r '.[].addr_info[0] | .local')

if [[ "$primaryIP" =~ 192.168.* ]]; then
  rm -f /tmp/whatsapp_cidrs.txt

  curl --silent -o /tmp/whatsapp_cidrs.txt https://raw.githubusercontent.com/HybridNetworks/whatsapp-cidr/main/WhatsApp/whatsapp_cidr_ipv4.txt


  sed -i '/^#/d' /tmp/whatsapp_cidrs.txt
  dos2unix /tmp/whatsapp_cidrs.txt

  if [[ "$1" == "delete" ]]; then
    while IFS= read -r line; do
      sudo ip r del "$line" via 192.168.178.1
    done < /tmp/whatsapp_cidrs.txt
    exit 0
  fi

  while IFS= read -r line; do
    sudo ip r add "$line" via 192.168.178.1
  done < /tmp/whatsapp_cidrs.txt
  notify-send "WhatApp Routing" "Enabled WhatsApp Routes over the Home Network"
else
  notify-send "WhatApp Routing" "Primary IP is not from 192.168.x.x network, skipping"
fi

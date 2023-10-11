#!/bin/bash

set -e


primaryIP=$(ip -j a show dev enp7s0f3u1u2 primary  | jq -r '.[].addr_info[0] | .local')

if [[ "$primaryIP" =~ 192.168.* ]]; then
  # WhatsApp CIDRs
  rm -f /tmp/whatsapp_cidrs.txt
  curl --silent -o /tmp/whatsapp_cidrs.txt https://raw.githubusercontent.com/HybridNetworks/whatsapp-cidr/main/WhatsApp/whatsapp_cidr_ipv4.txt
  sed -i '/^#/d' /tmp/whatsapp_cidrs.txt
  dos2unix /tmp/whatsapp_cidrs.txt

  # adding other cidrs to not be routed over the VPN
  cat > /tmp/other_cidrs.txt <<EOF
62.159.139.144/32
EOF


  if [[ "$1" == "delete" ]]; then
    while IFS= read -r line; do
      sudo ip r del "$line" via 192.168.178.1
    done < /tmp/whatsapp_cidrs.txt

    while IFS= read -r line; do
      sudo ip r del "$line" via 192.168.178.1
    done < /tmp/other_cidrs.txt
    notify-send -t 5000 "Routing" "Deleted custom routes"
    exit 0
  fi

  while IFS= read -r line; do
    sudo ip r add "$line" via 192.168.178.1
  done < /tmp/whatsapp_cidrs.txt

  while IFS= read -r line; do
    sudo ip r add "$line" via 192.168.178.1
  done < /tmp/other_cidrs.txt

  notify-send -t 5000 "Routing" "Enabled Custom Routes over the Home Network"
else
  notify-send -t 5000 "Routing" "Primary IP is not from 192.168.x.x network, skipping adding new routes"
fi

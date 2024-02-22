#!/bin/bash

yay -Sy > /dev/null 2>&1

updates="$(checkupdates)"
updates_escaped=${updates//$'\n'/\\n}
updates_count=$(echo "$updates" | wc -l)

if [[ -z $updates_count ]]; then
  echo '{"text": "0", "tooltip": "zero updates", "class":"$class"}'
  exit 0
fi

if echo "$updates" | grep -q "linux-lts"; then
  jo text="$updates_count ⚠️" tooltip="$updates_escaped" class="\$class"
  exit 0
fi


echo test
jo text="$updates_count" tooltip="$updates_escaped" class="\$class"
exit 0

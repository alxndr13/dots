#!/bin/bash

yay -Sy > /dev/null 2>&1

updates="$(checkupdates)"
updates_count=$(echo "$updates" | wc -l)

if [[ -z $updates_count ]]; then
  echo '{"text": "0", "tooltip": "zero updates", "class":"$class"}'
  exit 0
fi

if grep -q "linux-lts" "$updates"; then
  echo "{\"text\": \"$updates_count ⚠️\", \"tooltip\": \"$updates\",\"class\":\"\$class\"}"
  exit 0
fi

echo "{\"text\": \"$updates_count\", \"tooltip\": \"$updates\",\"class\":\"\$class\"}"
exit 0

#!/bin/bash

yay -Sy > /dev/null 2>&1

updates="$(yay -Qu)"
updates_count=$(echo "$updates" | wc -l)

if [[ -z $updates_count ]]; then
  echo 0
  exit 0
fi

file=$(mktemp)
echo $updates > "$file"


if grep -q "linux" $file; then
  rm -f "$file"
  echo "$updates_count ⚠️"
  exit 0
fi

rm -f "$file"
echo "$updates_count"
exit 0

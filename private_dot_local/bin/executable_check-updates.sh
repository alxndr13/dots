#!/bin/bash

yay -Sy > /dev/null 2>&1

updates="$(yay -Qu | wc -l)"

if [[ -z $updates ]]; then
  echo 0
  exit 0
fi

if [[ $(yay -Qu) == "*kernel*" ]]; then
  echo "$updates ⚠️"
  exit 0
fi

echo "$updates"

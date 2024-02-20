#
!/bin/bash
file=/tmp/check-updates-list

if [ $1 == "list" ]; then
  cat "$file"
  return 0
fi

yay -Sy > /dev/null 2>&1

updates="$(yay -Qu)"
updates_count=$(echo "$updates" | wc -l)

if [[ -z $updates_count ]]; then
  echo 0
  exit 0
fi

echo $updates > "$file"


if grep -q "linux-lts" $file; then
  rm -f "$file"
  echo "$updates_count ⚠️"
  exit 0
fi

rm -f "$file"
echo "$updates_count"
exit 0

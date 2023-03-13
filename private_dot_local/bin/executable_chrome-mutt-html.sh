#!/bin/sh

file="$1"
tmpfile="$(mktemp --suffix=.html)"
cp "$file" "$tmpfile"
chromium "$tmpfile"

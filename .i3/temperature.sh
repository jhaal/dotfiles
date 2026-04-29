#!/usr/bin/env bash
set -euo pipefail

if ! command -v sensors >/dev/null 2>&1; then
  echo "N/A"
  exit 0
fi

# Prefer package temperature when available; otherwise fall back to first
# core temperature entry.
sensors | awk '
  /Package id 0:/ {
    temp=$4
    gsub(/\+|°C/, "", temp)
    print temp "°C"
    found=1
    exit
  }
  /^Core [0-9]+:/ && !found {
    temp=$3
    gsub(/\+|°C/, "", temp)
    print temp "°C"
    found=1
    exit
  }
  END {
    if (!found) {
      print "N/A"
    }
  }
'

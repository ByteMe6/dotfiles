#!/usr/bin/env bash
# Print the monitor's I2C bus number, cached so ddcutil can skip its
# multi-second bus scan. Pass --refresh to force re-detection.
cache="${XDG_RUNTIME_DIR:-/tmp}/eww-ddc-bus"

if [ "$1" != "--refresh" ] && [ -s "$cache" ]; then
  cat "$cache"
  exit 0
fi

bus="$(ddcutil detect --brief 2>/dev/null | awk -F/dev/i2c- '/I2C bus:/ { print $2; exit }')"
[ -n "$bus" ] && echo "$bus" | tee "$cache"

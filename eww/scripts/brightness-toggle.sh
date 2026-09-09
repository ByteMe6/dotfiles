#!/usr/bin/env bash
# Toggle the brightness window, seeding it with the monitor's real
# brightness before it is shown so it never opens on the stale default.
here="$(dirname "$(readlink -f "$0")")"

if eww active-windows 2>/dev/null | grep -q '^brightness'; then
  eww close brightness
  exit 0
fi

v="$("$here/brightness-get.sh")"
[ -n "$v" ] && eww update brightness="$v"
eww open brightness

#!/usr/bin/env bash
# Toggle the wifi window, seeding it with a fresh scan before it is shown.
here="$(dirname "$(readlink -f "$0")")"

if eww active-windows 2>/dev/null | grep -q '^wifi'; then
  eww close wifi
  exit 0
fi

eww update wifi_networks="$("$here/wifi-list.sh")"
eww open wifi
# Rescan in the background and refresh once results are in.
(nmcli dev wifi rescan >/dev/null 2>&1; sleep 3; eww update wifi_networks="$("$here/wifi-list.sh")") &

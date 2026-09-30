#!/usr/bin/env bash
# Connect to (or disconnect from, if already active) the given SSID.
ssid="$1"
here="$(dirname "$(readlink -f "$0")")"

active="$(nmcli -t -f ACTIVE,SSID dev wifi | grep '^yes:' | cut -d: -f2-)"
if [ "$ssid" = "$active" ]; then
  nmcli con down id "$ssid" >/dev/null 2>&1
elif nmcli -t -f NAME con show | grep -Fxq "$ssid"; then
  nmcli con up id "$ssid" >/dev/null 2>&1
else
  nmcli dev wifi connect "$ssid" >/dev/null 2>&1 \
    || notify-send "Wi-Fi" "Не удалось подключиться к $ssid"
fi
eww update wifi_networks="$("$here/wifi-list.sh")"

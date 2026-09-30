#!/usr/bin/env bash
# Print the monitor's current brightness (VCP 0x10) as a plain integer.
here="$(dirname "$(readlink -f "$0")")"

get() {
  ddcutil --bus "$1" getvcp 10 --brief 2>/dev/null | awk '$1 == "VCP" { print $4; exit }'
}

v="$(get "$("$here/ddc-bus.sh")")"
[ -z "$v" ] && v="$(get "$("$here/ddc-bus.sh" --refresh)")"
echo "$v"

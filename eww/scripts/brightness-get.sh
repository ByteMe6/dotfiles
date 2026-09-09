#!/usr/bin/env bash
# Print the monitor's current brightness (VCP 0x10) as a plain integer.
ddcutil getvcp 10 --brief 2>/dev/null | awk '$1 == "VCP" { print $4; exit }'

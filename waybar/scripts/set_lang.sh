#!/bin/bash
TARGET=$1
LAYOUTS=$(hyprctl getoption input:kb_layout -j | jq -r '.str' | tr ',' '\n')
INDEX=0
for L in $LAYOUTS; do
    if [[ "$L" == *"$TARGET"* ]]; then
        hyprctl switchxkblayout all $INDEX
        break
    fi
    INDEX=$((INDEX+1))
done
eww -c ~/.config/waybar/eww-player close lang-window

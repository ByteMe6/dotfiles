#!/bin/bash
LAYOUTS=$(hyprctl getoption input:kb_layout -j | jq -r '.str' | tr ',' '\n')
CHOSEN=$(echo "$LAYOUTS" | rofi -dmenu -i -p "Language" -lines 4)
if [ -n "$CHOSEN" ]; then
    INDEX=$(echo "$LAYOUTS" | grep -n "^$CHOSEN$" | cut -d: -f1)
    if [ -n "$INDEX" ]; then
        hyprctl switchxkblayout all $((INDEX - 1))
    fi
fi

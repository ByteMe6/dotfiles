#!/bin/bash
LAYOUTS=$(hyprctl getoption input:kb_layout -j | jq -r '.str' | tr ',' '\n')
# Настройки Rofi: location: north east (правый верхний угол), отступы x/y подгоняют его под Waybar
CHOSEN=$(echo "$LAYOUTS" | rofi -dmenu -i -p " " -theme-str 'window {location: north east; anchor: north east; x-offset: -120px; y-offset: 45px; width: 12em; border-radius: 12px;} listview {lines: 4;}')
if [ -n "$CHOSEN" ]; then
    INDEX=$(echo "$LAYOUTS" | grep -n "^$CHOSEN$" | cut -d: -f1)
    if [ -n "$INDEX" ]; then
        hyprctl switchxkblayout all $((INDEX - 1))
    fi
fi

#!/bin/bash
STATUS=$(playerctl status 2>/dev/null)
if [ -z "$STATUS" ]; then exit 0; fi

TITLE=$(playerctl metadata title 2>/dev/null || echo "Unknown Title")
ARTIST=$(playerctl metadata artist 2>/dev/null || echo "Unknown Artist")

PLAY_PAUSE="▶ Play"
[ "$STATUS" = "Playing" ] && PLAY_PAUSE="⏸ Pause"

OPTIONS="⏭ Next\n$PLAY_PAUSE\n⏮ Previous"
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -p "$TITLE - $ARTIST" -lines 3 -theme-str 'window {width: 25em;}')

case "$CHOICE" in
    *"Next"*) playerctl next ;;
    *"Pause"*|*"Play"*) playerctl play-pause ;;
    *"Previous"*) playerctl previous ;;
esac

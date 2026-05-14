#!/bin/bash
# ╔══════════════════════════════════════════════════════════╗
# ║  waybar launch for i3                                   ║
# ║  waybar works natively on X11 with i3                   ║
# ╚══════════════════════════════════════════════════════════╝

# Kill any existing instance
pkill -x waybar 2>/dev/null
sleep 0.3

# Launch waybar (your existing config works on i3 too)
waybar &

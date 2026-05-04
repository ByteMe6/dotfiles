#!/usr/bin/env python3
import evdev, subprocess, json

def find_controller():
    for path in evdev.list_devices():
        dev = evdev.InputDevice(path)
        if dev.name == 'DualSense Wireless Controller' and evdev.ecodes.BTN_START in dev.capabilities().get(evdev.ecodes.EV_KEY, []):
            return dev
    return None

def is_fullscreen():
    result = subprocess.run(['hyprctl', 'activewindow', '-j'], capture_output=True, text=True)
    try:
        return json.loads(result.stdout).get('fullscreen', 0) != 0
    except:
        return False

dev = find_controller()
if not dev:
    exit("Controller not found")

for event in dev.read_loop():
    if event.type == evdev.ecodes.EV_KEY and event.value == 1:
        match event.code:
            case evdev.ecodes.BTN_START:
                if not is_fullscreen():
                    subprocess.run(['hyprctl', 'dispatch', 'exec', 'wofi --show drun'])
            case evdev.ecodes.BTN_EAST:
                if not is_fullscreen():
                    subprocess.run(['pkill', 'wofi'])
            case evdev.ecodes.BTN_MODE:
                if event.value == 1:  # Срабатывает только при нажатии (value 1)
                    if not is_fullscreen():
                        # -tenfoot запускает Steam сразу в режиме Big Picture
                        subprocess.run(['steam', '-tenfoot'])

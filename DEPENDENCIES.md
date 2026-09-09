# Dependencies

Arch / `pacman`. Adjust names for other distros.

## Core

```bash
sudo pacman -S hyprland hyprpaper waybar rofi-wayland rofi-calc wofi \
               kitty fish mako swaylock eww fastfetch
```

| Package | Used by |
|---|---|
| `hyprland` ≥ 0.55 | Lua config support (`hypr/hyprland.lua`) |
| `hyprpaper` | `hypr/hyprpaper.conf` |
| `waybar` | needs the `mpris` module |
| `rofi-wayland` + `rofi-calc` | `rofi/config.rasi` — `calc` mode |
| `wofi` | launched by `controller-wofi.py` |
| `eww` | `eww/eww.yuck` brightness popup |

## Helpers called by the configs

```bash
sudo pacman -S pamixer playerctl ddcutil brightnessctl jq flameshot \
               dolphin pavucontrol python-evdev papirus-icon-theme
```

| Package | Used by |
|---|---|
| `pamixer` | `XF86Audio*` binds |
| `playerctl` | media binds, waybar `custom/media-*`, `waybar/scripts/player_menu.sh` |
| `ddcutil` | `F7`/`F8`, `eww/scripts/brightness*.sh` |
| `brightnessctl` | keyboard backlight binds |
| `jq` | `waybar/scripts/lang*.sh` |
| `flameshot` | `Alt+3` / `Alt+5` |
| `dolphin` | `Super+E` |
| `pavucontrol` | waybar `pulseaudio` click, floated by a window rule |
| `python-evdev` | `controller-wofi.py` |
| `papirus-icon-theme` | `rofi/config.rasi` icon theme |

## Fonts

```bash
sudo pacman -S ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols noto-fonts
paru -S ttf-montserrat
```

| Font | Used by |
|---|---|
| JetBrains Mono NL / Nerd | `kitty.conf`, `waybar/style.css` |
| Symbols Nerd Font | waybar glyphs |
| Montserrat | `rofi/config.rasi` |
| Roboto Mono Nerd | `mako/config` |
| Noto Sans | `swaylock/config` |

## AUR

```bash
paru -S matugen-bin zen-browser-bin
```

`matugen` generates `waybar/theme.css`. `zen-browser` is bound to `Super+D`.

## Apps referenced by binds / rules / autostart

`telegram-desktop`, `spotify`, `obsidian`, `steam` — install only what you use, or edit
`hypr/conf/keybinds.lua`, `hypr/conf/windowrules.lua` and `hypr/conf/autostart.lua`.

## ddcutil setup

DDC/CI needs the `i2c-dev` module and group access:

```bash
sudo modprobe i2c-dev
echo i2c-dev | sudo tee /etc/modules-load.d/i2c-dev.conf
sudo usermod -aG i2c "$USER"   # re-login afterwards
ddcutil detect                 # should list your monitor
```

## Not covered here

`hypr/conf/autostart.lua` also launches a `volume.py` from a local CLion project
(`~/CLionProjects/ky-sound-change/`) that is not part of this repo.

-- Keybinds.
-- Docs: https://wiki.hypr.land/Configuring/Basics/Binds/
--       https://wiki.hypr.land/Configuring/Basics/Dispatchers/

local mainMod = "SUPER"

local terminal    = "kitty"
local fileManager = "dolphin"
-- local menu     = "wofi --show drun"
local menu     = "rofi -show drun"
local browser  = "zen-browser"
local telegram = "telegram-desktop"
local music    = "spotify"
local screenshot = "flameshot gui"

-- Apps
hl.bind(mainMod .. " + C",      hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + T",      hl.dsp.exec_cmd(telegram))
hl.bind(mainMod .. " + tab",    hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Y",      hl.dsp.exec_cmd(music))

-- Obsidian space
hl.bind(mainMod .. " + O",         hl.dsp.focus({ workspace = 41 }))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.window.move({ workspace = 41 }))

-- WM
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))  -- dwindle only; see conf/spotify.lua
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

-- Quit Hyprland. Was SUPER + M in the old config, but conf/spotify.lua rebinds
-- SUPER + M, so it lives on SUPER + SHIFT + M now.
hl.bind(mainMod .. " + SHIFT + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- Focus
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- Workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move / resize with the mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screenshots
-- hl.bind("ALT + 5", hl.dsp.exec_cmd("hyprshot -m window -o ~/Downloads/screenshots/"))
-- hl.bind("ALT + 4", hl.dsp.exec_cmd("hyprshot -m region -o ~/Downloads/screenshots/"))
-- hl.bind("ALT + 3", hl.dsp.exec_cmd("hyprshot -m output -o ~/Downloads/screenshots/"))
hl.bind("ALT + 3", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("ALT + 5", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("ALT + 5", hl.dsp.exec_cmd("flameshot gui"))


-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer --increase 5"),                    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer --decrease 5"),                    { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("pamixer --toggle-mute"),                   { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("pamixer --default-source --toggle-mute"),  { locked = true, repeating = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),                          { locked = true })
hl.bind("XF86AudioPause",       hl.dsp.exec_cmd("playerctl play-pause"),                    { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"),                    { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),                      { locked = true })

-- Screen brightness (laptop panel)
-- hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Monitor brightness over DDC
hl.bind("F7", hl.dsp.exec_cmd('bash -lc "/usr/bin/ddcutil setvcp 10 - 10"'))
-- hl.bind("F8", hl.dsp.exec_cmd('bash -lc "/usr/bin/ddcutil setvcp 10 + 10"'))
hl.bind("F8", hl.dsp.exec_cmd("ddcutil setvcp 10 + 10"))

-- Keyboard backlight
hl.bind("XF86LaunchA", hl.dsp.exec_cmd("brightnessctl --device='kbd_backlight' set 5%-"), { repeating = true })
hl.bind("XF86Search",  hl.dsp.exec_cmd("brightnessctl --device='kbd_backlight' set 5%+"), { repeating = true })

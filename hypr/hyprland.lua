-- ~/.config/hypr/hyprland.lua
-- Hyprland Lua config (0.55+). Ported from the old hyprlang hyprland.conf + conf.d/*.conf.
-- Docs: https://wiki.hypr.land/Configuring/Start/
-- Stubs for LSP autocompletion: /usr/share/hypr/stubs (see .luarc.json)

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = "rgb(5f88cf)",
            inactive_border = "rgb(1B1F3A)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
            enabled           = true,
            size              = 8, -- was 3
            passes            = 2, -- was 1
            vibrancy          = 0.1696,
            new_optimizations = true,
        },
    },

    animations = {
        enabled = true,
    },
})

--------------------
---- ANIMATIONS ----
--------------------
-- Curves must be declared before the animations that reference them.

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })
hl.animation({ leaf = "layers",      enabled = true, speed = 6,  bezier = "default", style = "slide" })

-----------------
---- LAYOUTS ----
-----------------

hl.config({
    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },
})

--------------
---- MISC ----
--------------

hl.config({
    misc = {
        force_default_wallpaper  = 0,
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        vrr                      = 0,
    },

    render = {
        direct_scanout = 0,
    },

    debug = {
        disable_logs = false,
    },
})

-------------------
---- SUBMODULES ----
-------------------
-- Each require() gets its own lua scope, so an error in one file does not stop
-- the others. Order matters: window rules and binds are evaluated top to bottom.
-- NOTE: the directory is "conf" (not "conf.d") on purpose - require() treats "."
-- as a directory separator, so "conf.d/x" would resolve to "conf/d/x".

require("conf/env")
require("conf/monitors")
require("conf/input")
require("conf/workspaces")
require("conf/windowrules")
require("conf/keybinds")
require("conf/spotify")
require("conf/autostart")

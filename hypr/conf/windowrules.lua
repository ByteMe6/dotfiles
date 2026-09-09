-- Window & layer rules. Evaluated top to bottom - the last match wins.
-- Docs: https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- hl.window_rule({ match = { class = "^(zoom)$" }, no_blur = true })

hl.layer_rule({ match = { namespace = "rofi" }, blur = true })

hl.window_rule({
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    float = true,
    size  = { 400, 500 },
    move  = { 1510, 50 },
})

hl.window_rule({ match = { class = "^(md.obsidian.Obsidian)$" }, workspace = "41 silent" })
hl.window_rule({ match = { class = "^(org.telegram.desktop)$" }, workspace = "2" })
hl.window_rule({ match = { class = "^(zen)$" },                  workspace = "1" })

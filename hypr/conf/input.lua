-- Input.
-- Docs: https://wiki.hypr.land/Configuring/Basics/Variables/
--       https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/

hl.config({
    input = {
        kb_layout  = "us,ru,ua",
        kb_options = "grp:ctrl_space_toggle",

        follow_mouse   = 1,
        sensitivity    = -0.5,
        natural_scroll = true,

        touchpad = {
            tap_to_click        = true,
            clickfinger_behavior = true,
            natural_scroll      = true,
        },
    },
})

-- Per-device config
hl.device({
    name           = "epic-mouse-v1",
    natural_scroll = true,
    sensitivity    = -0.5,
})

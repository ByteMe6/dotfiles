-- Monitors & cursor.
-- Docs: https://wiki.hypr.land/Configuring/Basics/Monitors/

-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@75", position = "0x0", scale = 1 })

hl.config({
    cursor = {
        no_hardware_cursors = 0, -- 0 = use hw cursors, 1 = never, 2 = auto
    },
})

-- Autostart.
-- Docs: https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar & hyprpaper")

    -- NOTE: this runs in the spawned shell, so it sets the shell's oom score,
    -- not Hyprland's. Kept for parity with the old config.
    hl.exec_cmd("echo -1000 > /proc/self/oom_score_adj")

    -- hl.exec_cmd("~/.config/nwg-dock-hyprland/launch.sh")
    hl.exec_cmd("eww daemon")
    -- hl.exec_cmd("flameshot")
    hl.exec_cmd("python /home/samedy/.local/bin/controller-wofi.py")
    hl.exec_cmd("/home/samedy/CLionProjects/ky-sound-change/vnev/bin/python /home/samedy/CLionProjects/ky-sound-change/volume.py")

    hl.exec_cmd("obsidian")
end)

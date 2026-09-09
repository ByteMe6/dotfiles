-- Environment variables (set before the display server initializes).
-- Docs: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Carried over from the old config. Note: pinning WAYLAND_DISPLAY by hand is
-- unusual - Hyprland sets it itself. Remove this line if anything acts up.
hl.env("WAYLAND_DISPLAY", "wayland-1")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Workspace rules.
-- Docs: https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local mainMonitor = "HDMI-A-1"
local ipadMonitor = "ipad"

-- Obsidian workspace
hl.workspace_rule({ workspace = "41", persistent = true, default_name = "O" })

-- MAIN workspaces (1 is also persistent, to avoid jumping)
for i = 1, 10 do
    hl.workspace_rule({
        workspace  = tostring(i),
        monitor    = mainMonitor,
        persistent = (i == 1) or nil,
    })
end

-- IPAD workspaces (11 is also persistent)
for i = 11, 20 do
    hl.workspace_rule({
        workspace  = tostring(i),
        monitor    = ipadMonitor,
        persistent = (i == 11) or nil,
    })
end

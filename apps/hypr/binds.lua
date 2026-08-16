local terminal    = "alacritty"
local tterminal   = "kitty"
local fileManager = "nautilus"
local menu        = "hyprlauncher"
local browser     = "brave-origin" --"brave --ozone-platform=wayland"

local mod = "SUPER"

-- Window management
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind("CTRL + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + SHIFT + RETURN", hl.dsp.exec_cmd(tterminal))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))   
hl.bind(mod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mod + arrow keys
hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "r" }))
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.swap({ direction = "d" }))

-- Scroll through existing workspaces with mod + scroll
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mod + [0-9]
-- Move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

--DMS keys 
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mod .. " + M", hl.dsp.exec_cmd("dms ipc call processlist focus"))
hl.bind(mod .. " + comma", hl.dsp.exec_cmd("dms ipc call settings focus"))
hl.bind(mod .. " + X", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(mod .. " + Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind(mod .. " + TAB", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind(mod .. " + PRINT", hl.dsp.exec_cmd("dms screenshot -d ~/Pictures/Screenshots"))
hl.bind(mod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("dms screenshot full -d ~/Pictures/Screenshots"))
hl.bind(mod .. " + ALT + L", hl.dsp.exec_cmd("dms ipc call lock lock"))

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("dms ipc call audio increment 3"),
    { locked = true, repeating = true }
)

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("dms ipc call audio decrement 3"),
    { locked = true, repeating = true }
)

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("dms ipc call audio mute"),
    { locked = true }
)

hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("dms ipc call audio micmute"),
    { locked = true }
)

hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("dms ipc call previous"),
    { locked = true }
)

hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("dms ipc call mpris playPause"),
    { locked = true }
)

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("dms ipc call mpris next"),
    { locked = true }
)


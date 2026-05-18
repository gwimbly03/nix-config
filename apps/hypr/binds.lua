local terminal    = "alacritty"
local tterminal   = "kitty"
local fileManager = "nautilus"
local menu        = "hyprlauncher"
local browser     = "brave --ozone-platform=wayland"

local mainMod = "SUPER"

-- Window management
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind("CTRL + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + SHIFT + RETURN", hl.dsp.exec_cmd(tterminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

--DMS keys 
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("dms ipc call processlist focus"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd("dms ipc call settings focus"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("dms screenshot -d ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("dms screenshot full -d ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("dms ipc call lock lock"))

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


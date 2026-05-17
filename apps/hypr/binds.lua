local mainMod = "SUPER"

-- App / utility binds
hl.bind("ALT, Space",        { action = "exec", args = "dms ipc call spotlight toggle" })
hl.bind(mainMod .. ", V",     { action = "exec", args = "dms ipc call clipboard toggle" })
hl.bind(mainMod .. ", M",     { action = "exec", args = "dms ipc call processlist toggle" })
hl.bind(mainMod .. ", N",     { action = "exec", args = "dms ipc call notifications toggle" })
hl.bind(mainMod .. ", comma", { action = "exec", args = "dms ipc call settings toggle" })
hl.bind(mainMod .. ", P",     { action = "exec", args = "dms ipc call notepad toggle" })
hl.bind("SUPERALT, L",        { action = "exec", args = "dms ipc call lock lock" })
hl.bind(mainMod .. ", X",     { action = "exec", args = "dms ipc call powermenu toggle" })
hl.bind(mainMod .. ", C",     { action = "exec", args = "dms ipc call control-center toggle" })

hl.bind(mainMod .. "SHIFT, N", { action = "exec", args = "dms ipc call night toggle" })

-- Screenshots
hl.bind(mainMod .. ", PRINT",       { action = "exec", args = "hyprshot -m output" })
hl.bind(mainMod .. "SHIFT, PRINT",  { action = "exec", args = "hyprshot -m region --clipboard-only" })

-- Window management
hl.bind(mainMod .. ", Q", { action = "killactive" })
hl.bind(mainMod .. ", F", { action = "fullscreen" })
hl.bind(mainMod .. ", T", { action = "togglefloating" })
hl.bind(mainMod .. ", J", { action = "togglesplit" })

-- Terminal / apps
hl.bind("CTRL, RETURN",       { action = "exec", args = "alacritty" })
hl.bind("CTRL_SHIFT, RETURN", { action = "exec", args = "kitty" })
hl.bind("CTRL_SHIFT, ESCAPE", { action = "exec", args = "alacritty -e htop" })

hl.bind(mainMod .. ", B", { action = "exec", args = "brave --ozone-platform=wayland" })

-- Focus movement
hl.bind(mainMod .. ", left",  { action = "movefocus", args = "l" })
hl.bind(mainMod .. ", right", { action = "movefocus", args = "r" })
hl.bind(mainMod .. ", up",    { action = "movefocus", args = "u" })
hl.bind(mainMod .. ", down",  { action = "movefocus", args = "d" })

-- Workspace scrolling (Mouse Wheel)
hl.bind(mainMod .. ", mouse_down", { action = "workspace", args = "e+1" })
hl.bind(mainMod .. ", mouse_up",   { action = "workspace", args = "e-1" })

-- Resize active window via arrows
hl.bind("SUPER_CTRL, left",  { action = "resizeactive", args = "-20 0" })
hl.bind("SUPER_CTRL, right", { action = "resizeactive", args = "20 0" })
hl.bind("SUPER_CTRL, up",    { action = "resizeactive", args = "0 -20" })
hl.bind("SUPER_CTRL, down",  { action = "resizeactive", args = "0 20" })

-- Split ratio
hl.bind("SUPER_CTRL, Minus", { action = "splitratio", args = "-0.1" })
hl.bind("SUPER_CTRL, Equal", { action = "splitratio", args = "0.1" })

-- Workspaces 1-10 Dynamic Iteration
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. ", " .. key,         { action = "workspace", args = tostring(i) })
    hl.bind(mainMod .. "SHIFT, " .. key,    { action = "movetoworkspace", args = tostring(i) })
end

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume",   { action = "exec", args = "dms ipc call audio increment 3" }, { locked = true, repeat = true })
hl.bind("XF86AudioLowerVolume",   { action = "exec", args = "dms ipc call audio decrement 3" }, { locked = true, repeat = true })
hl.bind("XF86AudioMute",          { action = "exec", args = "dms ipc call audio mute" },        { locked = true })
hl.bind("XF86AudioMicMute",       { action = "exec", args = "dms ipc call audio micmute" },     { locked = true })
hl.bind("XF86AudioPrev",          { action = "exec", args = "dms ipc call previous" },          { locked = true })
hl.bind("XF86AudioPlay",          { action = "exec", args = "dms ipc call mpris playPause" },   { locked = true })
hl.bind("XF86AudioNext",          { action = "exec", args = "dms ipc call mpris next" },         { locked = true })

hl.bind("XF86MonBrightnessUp",    { action = "exec", args = "dms ipc call brightness increment 5" }, { locked = true, repeat = true })
hl.bind("XF86MonBrightnessDown",  { action = "exec", args = "dms ipc call brightness decrement 5" }, { locked = true, repeat = true })

-- Mouse window controls (Flags updated to target mouse behaviors cleanly)
hl.bind(mainMod .. ", mouse:272", { action = "movewindow" },   { mouse = true })
hl.bind(mainMod .. ", mouse:273", { action = "resizewindow" }, { mouse = true })

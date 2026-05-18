local mainMod = "SUPER"

-- App / utility binds
hl.bind("ALT, Space", { action = "exec", args = "dms ipc call spotlight toggle" })
hl.bind(mainMod .. ", V", { action = "exec", args = "dms ipc call clipboard toggle" })
hl.bind(mainMod .. ", M", { action = "exec", args = "dms ipc call processlist toggle" })
hl.bind(mainMod .. ", N", { action = "exec", args = "dms ipc call notifications toggle" })
hl.bind(mainMod .. ", comma", { action = "exec", args = "dms ipc call settings toggle" })
hl.bind(mainMod .. ", P", { action = "exec", args = "dms ipc call notepad toggle" })
hl.bind("SUPER ALT, L", { action = "exec", args = "dms ipc call lock lock" })
hl.bind(mainMod .. ", X", { action = "exec", args = "dms ipc call powermenu toggle" })
hl.bind(mainMod .. ", C", { action = "exec", args = "dms ipc call control-center toggle" })

hl.bind("SUPER SHIFT, N", { action = "exec", args = "dms ipc call night toggle" })

-- Screenshots
hl.bind(mainMod .. ", PRINT", { action = "exec", args = "hyprshot -m output" })
hl.bind(mainMod .. " SHIFT, PRINT", { action = "exec", args = "hyprshot -m region --clipboard-only" })

-- Window management
hl.bind(mainMod .. ", Q", { action = "killactive" })
hl.bind(mainMod .. ", F", { action = "fullscreen" })
hl.bind(mainMod .. ", T", { action = "togglefloating" })
hl.bind(mainMod .. ", J", { action = "togglesplit" })

-- Terminal / apps
hl.bind("CTRL, RETURN", { action = "exec", args = "alacritty" })
hl.bind("CTRL SHIFT, RETURN", { action = "exec", args = "kitty" })
hl.bind("CTRL SHIFT, ESCAPE", { action = "exec", args = "alacritty -e htop" })

hl.bind(mainMod .. ", B", { action = "exec", args = "brave --ozone-platform=wayland" })

-- Focus movement
hl.bind(mainMod .. ", left", { action = "movefocus", args = "l" })
hl.bind(mainMod .. ", right", { action = "movefocus", args = "r" })
hl.bind(mainMod .. ", up", { action = "movefocus", args = "u" })
hl.bind(mainMod .. ", down", { action = "movefocus", args = "d" })

-- Workspace scrolling
hl.bind(mainMod .. ", mouse_down", { action = "workspace", args = "e+1" })
hl.bind(mainMod .. ", mouse_up", { action = "workspace", args = "e-1" })

-- Resize
hl.bind("SUPER CTRL, left", { action = "resizeactive", args = "-20 0" })
hl.bind("SUPER CTRL, right", { action = "resizeactive", args = "20 0" })
hl.bind("SUPER CTRL, up", { action = "resizeactive", args = "0 -20" })
hl.bind("SUPER CTRL, down", { action = "resizeactive", args = "0 20" })

-- Split ratio
hl.bind("SUPER CTRL, Minus", { action = "splitratio", args = "-0.1" })
hl.bind("SUPER CTRL, Equal", { action = "splitratio", args = "0.1" })

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. ", " .. key, { action = "workspace", args = tostring(i) })
    hl.bind(mainMod .. " SHIFT, " .. key, { action = "movetoworkspace", args = tostring(i) })
end

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume", { action = "exec", args = "dms ipc call audio increment 3" }, { locked = true, repeat = true })
hl.bind("XF86AudioLowerVolume", { action = "exec", args = "dms ipc call audio decrement 3" }, { locked = true, repeat = true })
hl.bind("XF86AudioMute", { action = "exec", args = "dms ipc call audio mute" }, { locked = true })
hl.bind("XF86AudioMicMute", { action = "exec", args = "dms ipc call audio micmute" }, { locked = true })
hl.bind("XF86AudioPrev", { action = "exec", args = "dms ipc call previous" }, { locked = true })
hl.bind("XF86AudioPlay", { action = "exec", args = "dms ipc call mpris playPause" }, { locked = true })
hl.bind("XF86AudioNext", { action = "exec", args = "dms ipc call mpris next" }, { locked = true })

hl.bind("XF86MonBrightnessUp", { action = "exec", args = "dms ipc call brightness increment 5" }, { locked = true, repeat = true })
hl.bind("XF86MonBrightnessDown", { action = "exec", args = "dms ipc call brightness decrement 5" }, { locked = true, repeat = true })

-- Suppress maximize events
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Open DMS windows as floating by default
hl.window_rule({ match = { class = "^(org.quickshell)$" }, floating = true })

-- Workspace assignments
hl.window_rule({ name = "steam-workspace",    match = { class = "steam" },           workspace = "9 silent" })
hl.window_rule({ name = "feishin-workspace",  match = { class = "feishin" },         workspace = "7" })
hl.window_rule({ name = "discord-workspace",  match = { class = "discord" },         workspace = "6" })
hl.window_rule({ name = "mpv-workspace",      match = { class = "mpv" },             workspace = "10" })

hl.window_rule({
    name = "nautilus-float",
    match = { class = "org\\.gnome\\.Nautilus" }, 
    float = true,
    size = { 875, 550 },
    rounding = 12,
   border_size = 0,
})

hl.window_rule({ match = { class = "^(org\\.gnome\\.Nautilus)$" }, floating = true })

hl.window_rule({ name = "mpv-float", match = { class = "mpv" }, float = true })

--hl.window_rule({
--    name = "gnome-rounding",
--    match = { class = "org\\.gnome\\." },       
--    rounding = 12,
--    border_size = 0,
--})

hl.window_rule({
    name = "kitty-opacity",
    match = { class = "kitty" },
})

hl.window_rule({
    name = "feishin-opacity",
    match = { class = "feishin" },
})

hl.window_rule({
    name = "discord-opacity",
    match = { class = "discord" },
})

hl.window_rule({
    name = "brave-opacity",
    match = { class = "brave-browser" },
})

hl.window_rule({
    name = "alacritty-opacity",
    match = { class = "alacritty" },
})

-- Workspace Monitor Rules
hl.workspace_rule({ workspace = "1", monitor = "DP-4" })
hl.workspace_rule({ workspace = "2", monitor = "DP-4" })
hl.workspace_rule({ workspace = "3", monitor = "DP-4" })
hl.workspace_rule({ workspace = "4", monitor = "DP-4" })
hl.workspace_rule({ workspace = "5", monitor = "DP-4" })
hl.workspace_rule({ workspace = "6", monitor = "DP-5" })
hl.workspace_rule({ workspace = "7", monitor = "DP-5" })
hl.workspace_rule({ workspace = "8", monitor = "DP-5" })
hl.workspace_rule({ workspace = "9", monitor = "DP-5" })
hl.workspace_rule({ workspace = "10", monitor = "DP-5" })


-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


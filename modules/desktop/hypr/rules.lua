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
    opacity = 0.92,
})

hl.window_rule({
    name = "brave-opacity",
    match = { class = "brave-origin" },
    opacity = 0.95
})

hl.window_rule({
    name = "alacritty-opacity",
    match = { class = "alacritty" },
    opacity = 0.60,
})

hl.window_rule({
    name = "nvim-opacity",
    match = { class = "Alacritty" },
    opacity = 0.85,
})


-- Workspace Monitor Rules
local benq = "desc:BNQ BenQ EX3210R"
local lg = "desc:LG Electronics 27GL650F"

for i = 1, 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = benq,
    })
end

for i = 6, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = lg,
    })
end

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Smart gaps
hl.workspace_rule({ workspace = "w[tv1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]s[false]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]s[false]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]s[false]" }, rounding = 0 })

-- Float browsers’ extension windows
hl.on("window.open", function(w)
    if w.class ~= "brave-origin" then return end
    if w.initial_title ~= "Brave Origin" then return end

    local ff_windows = hl.get_windows({ class = "brave-origin" })
    if #ff_windows <= 1 then return end

    hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))

    local sub
    sub = hl.on("window.title", function(tw)
        if tw.address ~= w.address then return end
        if tw.title == ""
            or tw.title == "Brave Origin"
            or tw.title == "about:blank"
            or tw.title:match("^about:.*Brave Origin$") then return end

        sub:remove()

        if tw.title:match("^Extension:") then
            hl.dispatch(hl.dsp.window.resize({ x = 800, y = 600, window = tw }))
            hl.dispatch(hl.dsp.window.center({ window = tw }))
            hl.dispatch(hl.dsp.focus({ window = tw }))
        else
            hl.dispatch(hl.dsp.window.float({ action = "unset", window = tw }))
        end
    end)
end)

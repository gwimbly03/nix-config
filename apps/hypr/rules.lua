local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
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

hl.window_rule({
  name = "steam-workspace",
  match = { class = "steam" },
  workspace = "9",
})

hl.window_rule({
  name = "feishin-workspace",
  match = { class = "feishin" },
  workspace = "7",
})

hl.window_rule({
  name = "discord-workspace",
  match = { class = "discord" },
  workspace = "6",
})

hl.window_rule({
  name = "mpv-workspace",
  match = { class = "mpv" },
  workspace = "9",
})

hl.window_rule({
  name = "nautilus-float",
  match = { class = "org\.gnome\.Nautilus" },
  float = true,
  size = {875, 550},
  rounding = 12,
  border_size = 0,
})

hl.window_rule({
  name = "mpv-float",
  match = { class = "mpv" },
  float = true,
})

hl.window_rule({
  name = "gnome-rounding",
  match = { class = "org\.gnome\..*" },
  rounding = 12,
  border_size = 0,
})

hl.window_rule({
  name = "kitty-opacity",
  match = { class = "kitty" },
  opacity = "0.8 0.7",
})

hl.window_rule({
  name = "feishin-opacity",
  match = { class = "feishin" },
  opacity = "0.80 0.80",
})

hl.window_rule({
  name = "discord-opacity",
  match = { class = "discord" },
  opacity = "0.80 0.80",
})

hl.window_rule({
  name = "brave-opacity",
  match = { class = "brave-browser" },
  opacity = "0.95 0.95",
})

hl.window_rule({
  name = "alacritty-opacity",
  match = { class = "alacritty" },
  opacity = "1.0 override 0.5 override 0.8 override",
})

hl.workspace_rule({
  workspace = "1",
  monitor = "DP-4",
})

hl.workspace_rule({
  workspace = "2",
  monitor = "DP-4",
})

hl.workspace_rule({
  workspace = "3",
  monitor = "DP-4",
})

hl.workspace_rule({
  workspace = "4",
  monitor = "DP-4",
})

hl.workspace_rule({
  workspace = "5",
  monitor = "DP-4",
})

hl.workspace_rule({
  workspace = "6",
  monitor = "DP-5",
})

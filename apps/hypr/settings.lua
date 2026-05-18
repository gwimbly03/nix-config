hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 8,
        border_size = 0,
        layout = "dwindle",
        allow_tearing = false,

        col = {
            active_border = {
                colors = {"rgba(33ccffee)", "rgba(00ff99ee)"},
                angle = 45
            },
            inactive_border = "rgba(595959aa)",
        },
    }
})
hl.config({
    decoration = {
        rounding = 14,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 10,
            render_power = 3,
            color = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            vibrancy = 0.1696,
            popups = true
        },
    }
})

hl.config({
    animations = {
        enabled = true,
    },

    dwindle = {
      preserve_split = true;
    },

    master = {
        new_status = "master",
    },

    scrolling = {
        fullscreen_on_one_column = true,
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },

    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        numlock_by_default = true,

        touchpad = {
            natural_scroll = false,
        },
    },

    debug = {
      suppress_errors = true
    },
})


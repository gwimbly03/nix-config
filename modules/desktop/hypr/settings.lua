hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

local benq = "desc BenQ EX3210R"
local lg = "desc Electronics 27GL650F"

hl.monitor({
  output = "benq",
  mode = "2560x1440@165",
  position = "0x0",
  scale = 1,
  bitdepth = 10,
})

hl.monitor({
  output = "lg",
  mode = "1920x1080@144",
  position = "2560x0",
  scale = 1,
  bitdepth = 10,  
})

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 8,
        border_size = 0,
        layout = "dwindle",
        allow_tearing = false,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
                angle = 45,
            },
            inactive_border = "rgba(595959aa)",
        },
    },
    decoration = {
        rounding = 14,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 10,
            render_power = 3,
            color = 0xee1a1a1a,  -- hex integer, not a string
        },
        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            vibrancy = 0.1696,
            variant = "frost",
            new_optimizations = true,
            popups = true,
        },
        wobble = {
            enabled = true,
            stiffness = 100,
            damping = 45,
            mass = 2,
            intensity = 0.6,
            mesh = 21,
        },
    },
    animations = {
        enabled = true,
        workspace_wraparound = true,
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
    },
})

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0,
        numlock_by_default = true,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.config({
    debug = {
        suppress_errors = true,
    },
})

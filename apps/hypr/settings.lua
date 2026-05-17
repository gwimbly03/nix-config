local terminal    = "alacritty"
local fileManager = "nautilus"
-- local menu        = "dms ipc call spotlight toggle"
local home = os.getenv("HOME")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Autostart applications
hl.on("hyprland.start", function()
  hl.exec_cmd("discord")
  hl.exec_cmd("steam")
  hl.exec_cmd("feishin")
  hl.exec_cmd("wpctl set-volume 65 15.0")
end)

hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 8,
        border_size = 0,

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 14,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 10,
            render_power = 2,
            color        = "0xee1a1a1a", -- Fixed: Hex token wrapped in quotes as a string
        },

        blur = {
            enabled   = true,
            size      = 5,
            passes    = 3,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
    
    -- Fixed: Moved from non-existent 'scrolling' category to layout configs
    dwindle = {
        preserve_split = true,
        fullscreen_on_one_column = true, 
    },

    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },

    input = {
        kb_layout    = "us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "",
        kb_rules     = "",
        follow_mouse = 1,
        numlock_by_default = true,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

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

luaConfig = ''

  local mainMod = "SUPER"

  -- App / utility binds
  hl.bind("ALT + Space",            hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
  hl.bind(mainMod .. " + V",        hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
  hl.bind(mainMod .. " + M",        hl.dsp.exec_cmd("dms ipc call processlist toggle"))
  hl.bind(mainMod .. " + N",        hl.dsp.exec_cmd("dms ipc call notifications toggle"))
  hl.bind(mainMod .. " + comma",    hl.dsp.exec_cmd("dms ipc call settings toggle"))
  hl.bind(mainMod .. " + P",        hl.dsp.exec_cmd("dms ipc call notepad toggle"))
  hl.bind("SUPERALT + L",           hl.dsp.exec_cmd("dms ipc call lock lock"))
  hl.bind(mainMod .. " + X",        hl.dsp.exec_cmd("dms ipc call powermenu toggle"))
  hl.bind(mainMod .. " + C",        hl.dsp.exec_cmd("dms ipc call control-center toggle"))

  hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("dms ipc call night toggle"))

  -- Screenshots
  hl.bind(mainMod .. " + PRINT",         hl.dsp.exec_cmd("hyprshot -m output"))
  hl.bind(mainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

  -- Window management
  hl.bind(mainMod .. " + Q", hl.dsp.window.close())
  hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
  hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
  hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

  -- Terminal / apps
  hl.bind("CTRL + RETURN",         hl.dsp.exec_cmd("alacritty"))
  hl.bind("CTRL + SHIFT + RETURN", hl.dsp.exec_cmd("kitty"))
  hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("alacritty -e htop"))

  hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("brave --ozone-platform=wayland"))

  -- Focus movement
  hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
  hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
  hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
  hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

  -- Workspace scrolling
  hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
  hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

  -- Resize active window
  hl.bind("SUPERCTRL + left",  hl.dsp.exec_cmd("hyprctl dispatch resizeactive -20 0"))
  hl.bind("SUPERCTRL + right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 20 0"))
  hl.bind("SUPERCTRL + up",    hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -20"))
  hl.bind("SUPERCTRL + down",  hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 20"))

  -- Split ratio
  hl.bind("SUPERCTRL + Minus", hl.dsp.exec_cmd("hyprctl dispatch splitratio -0.1"))
  hl.bind("SUPERCTRL + Equal", hl.dsp.exec_cmd("hyprctl dispatch splitratio 0.1"))

  -- Workspaces 1-9
  --for i = 1, 9 do
  --    hl.bind(mainMod .. " + " .. i,
  --        hl.dsp.focus({ workspace = i }))

  --    hl.bind(mainMod .. " + SHIFT + " .. i,
  --        hl.dsp.window.move({ workspace = i }))
  --end

  for i = 1, 10 do
      local key = i % 10 -- 10 maps to key 0
      hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
      hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
  end

  -- Multimedia keys
  hl.bind("XF86AudioRaiseVolume",
      hl.dsp.exec_cmd("dms ipc call audio increment 3"),
      { locked = true, repeating = true })

  hl.bind("XF86AudioLowerVolume",
      hl.dsp.exec_cmd("dms ipc call audio decrement 3"),
      { locked = true, repeating = true })

  hl.bind("XF86AudioMute",
      hl.dsp.exec_cmd("dms ipc call audio mute"),
      { locked = true })

  hl.bind("XF86AudioMicMute",
      hl.dsp.exec_cmd("dms ipc call audio micmute"),
      { locked = true })

  hl.bind("XF86AudioPrev",
      hl.dsp.exec_cmd("dms ipc call previous"),
      { locked = true })

  hl.bind("XF86AudioPlay",
      hl.dsp.exec_cmd("dms ipc call mpris playPause"),
      { locked = true })

  hl.bind("XF86AudioNext",
      hl.dsp.exec_cmd("dms ipc call mpris next"),
      { locked = true })

  hl.bind("XF86MonBrightnessUp",
      hl.dsp.exec_cmd('dms ipc call brightness increment 5 ""'),
      { locked = true, repeating = true })

  hl.bind("XF86MonBrightnessDown",
      hl.dsp.exec_cmd('dms ipc call brightness decrement 5 ""'),
      { locked = true, repeating = true })

  -- Mouse window controls
  hl.bind(mainMod .. " + mouse:272",
      hl.dsp.window.drag(),
      { mouse = true })

  hl.bind(mainMod .. " + mouse:273",
      hl.dsp.window.resize(),
      { mouse = true })

'';

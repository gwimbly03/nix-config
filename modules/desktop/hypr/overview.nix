{ inputs, pkgs }:

let
  plugin = inputs.scrolloverview.packages.${pkgs.stdenv.hostPlatform.system}.scrolloverview;
in
''
  -- Load the workspace preview plugin into the Lua config.
  hl.plugin.load("${plugin}/lib/libscrolloverview.so")

  -- Stack previews vertically at half size. Dwindle tiles the windows within them.
  hl.config({
    plugin = {
      scrolloverview = {
        layout = "vertical",
        scale = 0.5,
        workspace_gap = 64,
      },
    },
  })

  local corner_size = 8
  local interval_ms = 50
  local dwell_ms = 200
  local corner_monitor
  local hover_ms = 0

  -- Locate the top-left corner in the coordinates of the monitor under the cursor.
  local function monitor_in_corner()
    local monitor = hl.get_monitor_at_cursor()
    local cursor = hl.get_cursor_pos()
    if not monitor or not cursor then return nil end

    local x = cursor.x - monitor.position.x
    local y = cursor.y - monitor.position.y
    if x >= 0 and x < corner_size and y >= 0 and y < corner_size then
      return monitor.name
    end
  end

  -- Open once per visit after a short dwell. Leaving the corner rearms it.
  local hot_corner = hl.timer(function()
    local monitor = monitor_in_corner()
    if not monitor or monitor ~= corner_monitor then
      corner_monitor = monitor
      hover_ms = 0
      return
    end

    if hover_ms >= dwell_ms then return end
    hover_ms = hover_ms + interval_ms
    if hover_ms >= dwell_ms then
      -- The plugin returns a callable action when used outside a keybind.
      local open_overview = hl.plugin.scrolloverview.overview("open " .. monitor)
      open_overview()
    end
  end, { timeout = interval_ms, type = "repeat" })
''

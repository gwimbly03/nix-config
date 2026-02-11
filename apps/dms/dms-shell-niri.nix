let
  dmsSettings =
    builtins.fromJSON (builtins.readFile ./niri_settings.json);
in
{
programs.dank-material-shell = {
  enable = true;

  systemd = {
      enable = true;           # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dankMaterialShell changes
    };

  settings = dmsSettings;
  managePluginSettings = true;

  enableSystemMonitoring = true;     # System monitoring widgets (dgop)
  enableVPN = true;                  # VPN management widget
  enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
  enableAudioWavelength = true;      # Audio visualizer (cava)
  enableCalendarEvents = true;       # Calendar integration (khal)
  enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)

  plugins = {
      dankBatteryAlerts.enable = true;
      dockerManager.enable = true;
      dankKDEConnect.enable = true;
      dankLauncherKeys.enable = true;
      tailscale.enable = true;
      nixMonitor.enable = true;
      displayMirror.enable = true;
      dmsLenovoBatterySettings.enable = true;
      
      mediaPlayer = {
        enable = true;

        settings = {
          preferredSource = "feishin";
        };
      };
    };
  };
}

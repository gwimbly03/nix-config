{ config, pkgs, ... }:
let
  dmsSettings =
    builtins.fromJSON (builtins.readFile ./settings.json);
in
{
programs.dank-material-shell = {
  enable = true;

  systemd = {
      enable = true;           # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dankMaterialShell changes
    };

  managePluginSettings = true;

  # Core features
  enableSystemMonitoring = true;     # System monitoring widgets (dgop)
  enableVPN = true;                  # VPN management widget
  enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
  enableAudioWavelength = true;      # Audio visualizer (cava)
  enableCalendarEvents = true;       # Calendar integration (khal)
  enableClipboardPaste = true;       # Pasting items from the clipboard (wtype)

  plugins = {
      # Simply enable plugins by their ID (from the registry)
      dankBatteryAlerts.enable = true;
      dockerManager.enable = true;
      dankKDEConnect.enable = true;
      dankLauncherKeys.enable = true;
      tailscale.enable = true;
      nixMonitor.enable = true;
      displayMirror.enable = true;
      dmsLenovoBatterySettings.enable = true;
      
      # Add plugin-specific settings
      mediaPlayer = {
        enable = true;

        # You can only define settings here if using the home-manager module
        settings = {
          preferredSource = "feishin";
        };
      };
    };
  };
}

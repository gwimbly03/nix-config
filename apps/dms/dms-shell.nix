{
  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;           # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dankMaterialShell changes
    };

    managePluginSettings = true;
    settings = (import ./hypr_settings.nix);
 
    # Core features
    enableSystemMonitoring = true;   # System monitoring widgets (dgop)
    enableVPN = true;                # VPN management widget
    enableDynamicTheming = true;     # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;    # Audio visualizer (cava)
    enableCalendarEvents = true;     # Calendar integration (khal)
    
    plugins = {
      # Simply enable plugins by their ID (from the registry)
      dockerManager.enable = true;
      dankKDEConnect.enable = true;
      dankLauncherKeys.enable = true;
      tailscale.enable = true;
      nixMonitor.enable = true;
      
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


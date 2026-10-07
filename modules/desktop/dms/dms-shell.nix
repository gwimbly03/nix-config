{ lib, ... }:
let
  dmsSettings =
    builtins.fromJSON (builtins.readFile ./hypr_settings.json);
in
{
  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true;           
      restartIfChanged = true;
    };

    managePluginSettings = true;
    settings = lib.mkForce dmsSettings;

    enableSystemMonitoring = true;   
    enableVPN = true;                
    enableDynamicTheming = true;     
    enableAudioWavelength = true;   
    enableCalendarEvents = true;  
    enableClipboardPaste = true;       

    
    plugins = {
      dockerManager.enable = true;
      dankKDEConnect.enable = true;
      dankLauncherKeys.enable = true;
      dankAudioVisualizer.enable = true;
      dankscale.enable = true;
      netStatus.enable = true;
      wallpaperCarousel.enable = true;
      bongoCat.enable = true;
      bitwarden.enable = true;
      discordVoice.enable = true;
      audioFx.enable = true;
      dmsThemeSync.enable = true;
      depthscape.enable = true;
      linuxWallpaperEngine.enable = true;
      audioPortSwitcher.enable = true;
      nixPackageRunner.enable = true;

      mediaPlayer = {
        enable = true;

        settings = {
          preferredSource = "feishin";
        };
      };
    };
  };
}


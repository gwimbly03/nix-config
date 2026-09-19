{ lib, ... }:
let
  dmsSettings =
    builtins.fromJSON (builtins.readFile ./niri_settings.json);
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
        dankBatteryAlerts.enable = true;
        dankKDEConnect.enable = true;
        dankLauncherKeys.enable = true;
        tailscale.enable = true;
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

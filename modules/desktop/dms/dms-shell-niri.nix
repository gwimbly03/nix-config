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

  settings = lib.mkForce dmsSettings;
  managePluginSettings = true;

  enableSystemMonitoring = true;     
  enableVPN = true;                 
  enableDynamicTheming = true;     
  enableAudioWavelength = true;    
  enableCalendarEvents = true;    
  enableClipboardPaste = true;   

  plugins = {
      dankBatteryAlerts.enable = true;
      dockerManager.enable = true;
      dankKDEConnect.enable = true;
      dankLauncherKeys.enable = true;
      tailscale.enable = true;
      displayMirror.enable = true;
      dmsLenovoBatterySettings.enable = true;

      nixMonitor = {
        enable = true;
        
        settings = {
            rebuildCommand = [ 
              "bash" "-c" 
              "nh os switch . -H Cyclonus 2>&1"
            ];

            gcCommand = [ 
              "bash" "-c" 
              "nh clean all 2>&1" 
            ];

            nixpkgsChannel = "nixos-unstable";


            updateInterval = 600;

        };
      };

      
      mediaPlayer = {
        enable = true;

        settings = {
          preferredSource = "feishin";
        };
      };
    };
  };
}

{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    extraPackages = with pkgs; [
      steam-run
      steamcmd
      steam-tui
      protontricks
      lutris
      protonup-qt
      nexusmods-app
      winetricks
    ];
  };

  # Enable Gamescope separately on your channel
  programs.gamescope.enable = true;

  # Modern way to set session env vars
  environment.sessionVariables = {
    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

}


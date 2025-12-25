{ pkgs, ... }:

{
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

  };

  hardware.steam-hardware.enable = true;

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  programs.steam.protontricks.enable = true;

  environment.sessionVariables = {
    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  environment.systemPackages = [
    pkgs.steam-run
    pkgs.steamcmd
    pkgs.steam-tui
    pkgs.lutris
    pkgs.protonup-qt
    pkgs.nexusmods-app
    pkgs.wineWowPackages.stagingFull
    pkgs.wineWowPackages.waylandFull
    pkgs.winetricks


  ];


}


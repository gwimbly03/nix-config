{ pkgs, envVars, ... }:

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

  environment.sessionVariables = envVars.steamSession;

  environment.systemPackages = [
    pkgs.steam-run
    pkgs.steamcmd
    pkgs.steam-tui
    #pkgs.lutris
    pkgs.protonup-qt
    pkgs.wineWow64Packages.stagingFull
    pkgs.wineWow64Packages.waylandFull
    pkgs.winetricks
    pkgs.amethyst-mod-manager
    #pkgs.deadlock-mod-manager

  ];


}


{ config, pkgs, lib, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    # Pull the package and portal package from the flake
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    systemd.variables = [ "--all" ];

    settings = lib.mkMerge [
      (import ./settings.nix)
      (import ./binds.nix)
      (import ./animations.nix)
      (import ./rules.nix)
    ];
  };
}



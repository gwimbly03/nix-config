{ inputs, lib, pkgs, envVars, ... }:

let
  envLines = lib.mapAttrsToList
    (name: value: "hl.env(${builtins.toJSON name}, ${builtins.toJSON value})")
    envVars.hyprland;
in

{
  wayland.windowManager.hyprland = {
    enable = true;

    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    systemd.variables = [ "--all" ];
  };

  xdg.configFile."hypr/hyprland.lua".text = ''

    require("binds")
    require("animations")
    require("rules")
    require("settings")
    require("overview")
    require("autostart")
  '';

  # Ensure your Lua modules exist in the right place (optional but recommended)
  xdg.configFile."hypr/binds.lua".source = ./binds.lua;
  xdg.configFile."hypr/animations.lua".source = ./animations.lua;
  xdg.configFile."hypr/rules.lua".source = ./rules.lua;
  xdg.configFile."hypr/settings.lua".text =
    lib.concatStringsSep "\n" envLines + "\n\n" + builtins.readFile ./settings.lua;
  xdg.configFile."hypr/overview.lua".text = import ./overview.nix { inherit inputs pkgs; };
  xdg.configFile."hypr/autostart.lua".source = ./autostart.lua;


}

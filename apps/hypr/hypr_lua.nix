{inputs, pkgs, ...}: 

{
  
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    systemd.variables = ["--all"];
     
    extraConfig = ''
        require("settings")
        require("binds")
        require("animations")
        require("rules")
      '';
    };

    xdg.configFile."hypr/settings.lua".source = ./settings.lua;
    xdg.configFile."hypr/binds.lua".source = ./binds.lua;
    xdg.configFile."hypr/animations.lua".source = ./animations.lua;
    xdg.configFile."hypr/rules.lua".source = ./rules.lua;
}

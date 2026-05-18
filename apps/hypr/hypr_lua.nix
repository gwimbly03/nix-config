{ inputs, pkgs, ... }:

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
    -- Allow Lua to find modules in ~/.config/hypr
    package.path = os.getenv("HOME") .. "/.config/hypr/?.lua;" .. package.path

    require("binds")
    require("animations")
    require("rules")
    require("settings")
    require("autostart")
  '';

  # Ensure your Lua modules exist in the right place (optional but recommended)
  xdg.configFile."hypr/binds.lua".source = ./binds.lua;
  xdg.configFile."hypr/animations.lua".source = ./animations.lua;
  xdg.configFile."hypr/rules.lua".source = ./rules.lua;
  xdg.configFile."hypr/settings.lua".source = ./settings.lua;
  xdg.configFile."hypr/autostart.lua".source = ./autostart.lua;


}

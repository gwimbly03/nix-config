{ lib, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;           
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    systemd.variables = ["--all"];
    settings = (import ./settings.nix)
      // (import ./binds.nix)
      // (import ./animations.nix)
      // (import ./rules.nix)
      // {
        decoration.shadow.color = lib.mkForce "rgba(0, 0, 0, 0.25)";
        exec-once = [
          "discord"
          "steam"
          "feishin"
          "wpctl set-volume 65 15.0"
        ];
      };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
    HYPRSHOT_DIR = "/home/gwimbly/Pictures/Screenshots";
  };

  home.packages = [
    # ... other packages
    pkgs.hyprshot
    pkgs.playerctl
    pkgs.hyprpwcenter
    pkgs.hyprlang 
    pkgs.hyprqt6engine
    pkgs.hyprpicker 
    pkgs.hyprgraphics
    pkgs.hyprwayland-scanner
    pkgs.hyprland-guiutils
    pkgs.aquamarine
    pkgs.hyprsysteminfo
    pkgs.egl-wayland
  ];
}


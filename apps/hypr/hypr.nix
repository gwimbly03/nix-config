{ pkgs, lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd.variables = [ "--all" ];

    settings = import ./settings.nix
               // import ./binds.nix
               // import ./animations.nix
               // import ./rules.nix
               // {
                 decoration.shadow.color = lib.mkForce "rgba(0, 0, 0, 0.25)";
               };
  };
}


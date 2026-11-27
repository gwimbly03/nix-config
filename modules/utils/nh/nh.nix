{ uname, ... }:
{
  programs.nh = {
    enable = true;

    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 4d --keep 3";
    };

    flake = "/home/${uname}/.nix-config";
  };
}

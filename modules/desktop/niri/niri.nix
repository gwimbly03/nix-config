{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    config = builtins.readFile ./config_serpantinum.kdl;
  };
}


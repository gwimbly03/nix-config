{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
    package = pkgs.starship;

    enableFishIntegration = true;
    enableInteractive = true;

    settings = pkgs.lib.importTOML ./starship.toml;

    validateFiles.config = true;
  };
}

{  pkgs, inputs, lib, uname, envVars, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) system;
  allPackages = import ../../pkgs/Megatronus/hm_packages.nix { inherit pkgs; };
  importModules = import ../../lib/imports.nix { inherit lib; };
in
{
  home = {
    username = uname;
    homeDirectory = "/home/${uname}";
    stateVersion = "26.05";

    pointerCursor.enable = true;

    packages = allPackages;

    sessionVariables = envVars.home;
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.stylix.homeModules.stylix
    #inputs.dms.homeModules.dank-material-shell
    #inputs.dms-plugin-registry.homeModules.default
    inputs.serpantinum.homeManagerModules.default
    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord


    ../../env/stylix/stylix.nix
    ../../modules/utils/zoxide.nix
    ../../modules/utils/fzf.nix
    ../../modules/utils/fish/hypr_fish.nix
    ../../modules/desktop/hypr/hypr_lua.nix
    #../../modules/desktop/dms/dms-shell.nix
    ../../modules/desktop/serpantinum/serpantinum.nix
    ../../modules/apps/nixcord.nix
    ../../modules/nixvim/nixvim.nix
    ../../modules/utils/alacritty.nix
    ../../modules/utils/kitty.nix
    ../../modules/utils/git.nix
    ../../modules/utils/fastfetch/fastfetch.nix
    ../../modules/apps/obs.nix
    ../../modules/utils/superfile.nix
    ../../modules/utils/starship/starship.nix
    ../../modules/utils/lsd.nix

  ];



  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs = {
    home-manager.enable = true;

    nixvim = {
      extraPackages = with pkgs; [ wl-clipboard ];
      opts.clipboard = [ "unnamedplus" ];
    }; 

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

  };
}


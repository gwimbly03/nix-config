{ config, pkgs, inputs, ... }:

let
  #inherit (pkgs.stdenv.hostPlatform) system;
  allPackages = import ../../pkgs/Cyclonus/hm_packages.nix { inherit pkgs; };
in
{
  home = {
    username = "gwimbly";
    homeDirectory = "/home/gwimbly";
    stateVersion = "25.11";

    packages = allPackages;

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      NIXOS_OZONE_WL = "1";
    };
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.stylix.homeModules.stylix
    inputs.dms.homeModules.dank-material-shell
    inputs.dms-plugin-registry.homeModules.default
    inputs.serpantinum.homeManagerModules.default
    inputs.niri.homeModules.niri
    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord

    ../../env/stylix/stylix.nix
    ../../modules/desktop/dms/dms-shell-niri.nix
    ../../modules/utils/fish/fish.nix
    ../../modules/utils/fastfetch/fastfetch.nix
    ../../modules/desktop/niri/niri.nix
    #../../modules/desktop/serpantinum/serpantinum.nix
    ../../modules/apps/nixcord.nix
    ../../modules/nixvim/nixvim.nix
    ../../modules/utils/alacritty.nix
    ../../modules/utils/git.nix
    ../../modules/utils/ghostty.nix
    ../../modules/apps/obs.nix
    ../../modules/apps/brave.nix
    ../../modules/utils/starship/starship.nix
    ../../modules/utils/superfile.nix
    ../../modules/utils/btop.nix
    ../../modules/steam/steam.nix
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs = {
    home-manager.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

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


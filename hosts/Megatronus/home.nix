{ config, pkgs, inputs, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) system;
  allPackages = import ../../pkgs/Megatronus/hm_packages.nix { inherit pkgs; };
  stablePkgs = import inputs.nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };
in
{
  home = {
    username = "gwimbly";
    homeDirectory = "/home/gwimbly";
    stateVersion = "25.11";

    packages = allPackages
    ++ [ stablePkgs.protontricks ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      NIXOS_OZONE_WL = "1";
    };
  };

  nixpkgs.config.allowUnfree = true;

  imports = [
    inputs.stylix.homeModules.stylix
    inputs.dms.homeModules.dankMaterialShell.default
    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord


    ../../env/stylix/stylix.nix
    ../../apps/fish/hypr_fish.nix
    ../../apps/hypr/hypr.nix
    ../../apps/dms/dms-shell.nix
    ../../apps/nixcord.nix
    ../../apps/nixvim/nixvim.nix
    ../../apps/alacritty.nix
    ../../apps/git.nix
    ../../apps/fastfetch/fastfetch.nix
    ../../apps/ghostty.nix
    ../../apps/obs.nix
    ../../apps/brave.nix
    ../../apps/btop.nix
    ../../apps/superfile.nix
    ../../apps/starship/starship.nix
  ];



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


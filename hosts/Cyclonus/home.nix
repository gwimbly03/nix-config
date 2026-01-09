{ config, pkgs, inputs, ... }:

let
  inherit (pkgs.stdenv.hostPlatform) system;

  allPackages = import ../../pkgs/hm_packages.nix { inherit pkgs; };
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

    inputs.nixvim.homeModules.nixvim
    inputs.nixcord.homeModules.nixcord

    ../../env/stylix/stylix.nix
    ../../apps/dms/dms-shell-niri.nix
    ../../apps/fish/fish.nix
    ../../apps/fastfetch/fastfetch.nix
    ../../apps/hypr/hypr.nix
    ../../apps/nixcord.nix
    ../../apps/nixvim/nixvim.nix
    ../../apps/alacritty.nix
    ../../apps/git.nix
    ../../apps/ghostty.nix
    ../../apps/obs.nix
    ../../apps/brave.nix
    ../../apps/lazygit.nix
    ../../apps/btop.nix
    ../../apps/superfile.nix
    ../../apps/starship/starship.nix
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


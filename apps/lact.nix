{ config, pkgs, ... }: {
  environment.systemPackages = [
    pkgs.lact
  ];
}


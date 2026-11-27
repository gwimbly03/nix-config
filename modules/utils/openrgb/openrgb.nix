{ config, lib, pkgs, ... }:

let
  cfg = config.services.hardware.openrgb;
in

{
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
    server.port = 6742;
  };

  systemd.services.openrgb.serviceConfig.ExecStart = lib.mkForce (
    "${cfg.package}/bin/openrgb --config /var/lib/OpenRGB --server --server-port ${toString cfg.server.port} --profile main"
  );
}

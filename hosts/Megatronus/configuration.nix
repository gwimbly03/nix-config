{ config, pkgs, inputs, lib, self, ... }:

{
  imports = [
    #./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.dankMaterialShell.nixosModules.greeter
    ../../env/env.nix
    ../../pkgs/packages.nix
    ../../apps/steam.nix
    ../../apps/lact.nix
  ];

  # Timezone
  time.timeZone = "America/Vancouver";

  # Nixpkgs config
  nixpkgs.config = {
    allowUnfree = true;
    overlays = [
      (final: prev: {
        nur = import inputs.nur { nurpkgs = prev; pkgs = prev; };
      })
    ];
  };

  # Users & groups
  users = {
    groups = {
      i2c = {};
      wireshark = {};
    };

    users.gwimbly = {
      isNormalUser = true;
      description = "gwimbly";
      shell = pkgs.fish;
      extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" "plugdev" "bluetooth" "i2c" "wireshark" ];
    };
  };

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    wheelNeedsPassword = false;
    extraRules = [{
      users = [ "gwimbly" ];
      keepEnv = true;
      persist = true;
    }];
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users."gwimbly" = import ./home.nix;
    backupFileExtension = "bak";
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    nerd-fonts.ubuntu
    nerd-fonts.mononoki 
    nerd-fonts.fira-code
    nerd-fonts.roboto-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    material-icons
    material-symbols
    nixos-icons
    bibata-cursors
    candy-icons
  ];

  # Bootloader & kernel
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/nvme0n1"; # adjust if needed
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = [ "i2c-dev" ];
  boot.initrd.availableKernelModules = [ "i2c-dev" ];

  # Services
  services = {
    pipewire.enable = true;
    pipewire.alsa.enable = true;
    pipewire.alsa.support32Bit = true;
    pipewire.pulse.enable = true;
    pipewire.wireplumber.enable = true;

    power-profiles-daemon.enable = true;
    upower.enable = true;
    printing.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;

    tailscale.enable = true;
    tailscale.useRoutingFeatures = "client";

    dbus.enable = true;
    dbus.packages = [ pkgs.bluez ];

    openssh.enable = true;
    openssh.settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = "no";
    };
  };

  networking = {
    hostName = "Megatronus";
    networkmanager.enable = true;
    wireless.enable = false;
    wireless.userControlled.enable = false;
    networkmanager.wifi.backend = "wpa_supplicant";
    networkmanager.wifi.powersave = false;
  };

  # Hardware & graphics
  hardware = {
    enableRedistributableFirmware = true;
    bluetooth.enable = true;
    opengl.enable = true;
    opengl.extraPackages = with pkgs; [ nvidia-x11 ];
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
      powerManagement.enable = false;
    };
  };

  # Environment tweaks
  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
  };
  environment.shellAliases.sudo = "doas";
  environment.systemPackages = with pkgs; [
    bluez tlp lm_sensors openssl nh vulkan-tools nvidia-smi
  ];

  # Udev packages
  services.udev.packages = [ pkgs.rwedid ];

  # Localization
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = lib.genAttrs [
    "LC_ADDRESS" "LC_IDENTIFICATION" "LC_MEASUREMENT" "LC_MONETARY"
    "LC_NAME" "LC_NUMERIC" "LC_PAPER" "LC_TELEPHONE" "LC_TIME"
  ] (_: "en_US.UTF-8");

  # Programs
  programs = {
    fish.enable = true;
    wireshark.enable = true;
    wireshark.usbmon.enable = true;
    dconf.enable = true;
    ssh.startAgent = true;

    nh.enable = true;
    nh.flake = "/home/gwimbly/.nixos-config/";
    nh.clean.enable = true;
    nh.clean.extraArgs = "--keep-since 4d --keep 3";
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  system.stateVersion = "25.11"; # NixOS release version
}


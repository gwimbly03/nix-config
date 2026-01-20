{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    mesa
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    tlp
    acpi
    lm_sensors
    power-profiles-daemon
    networkmanagerapplet
    niri

    adw-gtk3
    feishin

    # TUI
    htop

    # Desktop
    nwg-look

    # Development
    gcc
    gh
    nixfmt
    black

    # Utilities
    jq
    socat
    tree
    libnotify
    wl-clipboard
    cliphist
    pywalfox-native
    wallust
    imagemagick
    rar
    unzip
    p7zip
    mpv
    cava
    brightnessctl
    fzf
    git
    wget
    curl
    lsd
    ripgrep
    bat
    starship
    less
    zoxide
    fd
    microfetch

    # Networking & containers
    tailscale
    qemu
    docker
    docker-compose
    wireshark
    nmap

    # Niri
    xwayland-satellite
  ];
}


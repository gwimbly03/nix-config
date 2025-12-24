{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    mesa
    tlp
    acpi
    lm_sensors
    power-profiles-daemon

    # Gaming
    openrgb-with-all-plugins
    bottles

    file-roller
    adw-gtk3
    telegram-desktop
    supersonic
    feishin

    # TUI
    btop

    # Desktop
    nwg-look

    # Development
    gcc
    gh
    nixfmt-rfc-style
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
    fzf
    git
    wget
    curl
    lsd
    ripgrep
    bat
    less
    zoxide
    fd
    microfetch
    pulsemixer

    # Networking & containers
    docker
    docker-compose
    wireshark
    nmap
  ];
}


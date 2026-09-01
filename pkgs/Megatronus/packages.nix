{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    acpi
    power-profiles-daemon

    # Gaming
    openrgb-with-all-plugins

    file-roller
    adw-gtk3
    telegram-desktop
    feishin

    # TUI
    htop
    valent

    # Desktop
    nwg-look

    # Development
    gcc
    gh
    nixfmt
    black
    satty
    glaze

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
    pavucontrol
    picard
    brave-origin


    # Networking & containers
    docker
    docker-compose
    wireshark
    nmap
    tcpdump
    libpcap
    dnsutils

    codex
  ];
}


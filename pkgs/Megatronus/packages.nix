{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    acpi
    power-profiles-daemon

    # Gaming
    openrgb-with-all-plugins

    file-roller
    adw-gtk3
    telegram-desktop
    supersonic
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
    inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.mo2installer
    inputs.HyprQuickFrame.packages.${pkgs.stdenv.hostPlatform.system}.default
    picard
    fladder


    # Networking & containers
    docker
    docker-compose
    wireshark
    nmap
    tcpdump
    libpcap
    dnsutils
  ];
}


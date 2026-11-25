{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    acpi
    power-profiles-daemon

    # Gaming
    file-roller
    adw-gtk3
    telegram-desktop
    feishin
<<<<<<< HEAD
    codex
=======
    android-tools

>>>>>>> 2e6228f1f783af0a883dcf9745fcef2d93929137
    # TUI
    htop
    valent
    ladybird

    # Desktop
    nwg-look

    # Development
    gcc
    gh
    nixfmt
    black
    satty
    glaze
    playerctl
    easyeffects

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
    ffmpeg
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
    spek
    flac
    brave-origin
    pavucontrol


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


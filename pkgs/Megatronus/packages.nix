{ pkgs, inputs, system, ... }: {
  environment.systemPackages = with pkgs; [
    acpi
    power-profiles-daemon

    # Gaming
    openrgb-with-all-plugins
    bottles
    # nix-citzen
    inputs.nix-citizen.packages.${system}.rsi-launcher

    file-roller
    adw-gtk3
    telegram-desktop
    supersonic
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


{ pkgs, ... }:
{
  # Enable Nautilus (GNOME Files)
  programs.nautilus = {
    enable = true;
  };

  # Optional GNOME file system helpers (recommended)
  services.gvfs.enable = true;            # Mounting, network shares, trash, etc.
  services.udisks2.enable = true;         # Automounting removable devices

  # Archive manager (like file-roller)
  programs.file-roller = {
    enable = true;
    package = pkgs.file-roller;
  };

  # Useful Nautilus extensions:
  home.packages = with pkgs; [
    nautilus-open-any-terminal   # Right-click → Open terminal
    sushi                        # Quick preview (spacebar)
    # Optional thumbnailers:
    ffmpegthumbnailer
    gnome-tweak-tool
  ];
}

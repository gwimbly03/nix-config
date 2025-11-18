{ pkgs, ... }:

with pkgs;

[
  nodePackages.prettier
  xwayland
  ffmpeg
  typst
  linux-wallpaperengine
]


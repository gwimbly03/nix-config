{ pkgs, ... }:

with pkgs;

[
  wget
  git
  nodePackages.prettier
  xwayland
  ffmpeg
  typst
  linux-wallpaperengine
]


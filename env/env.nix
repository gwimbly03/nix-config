let
  editor = "nvim";
in
{
  home = {
    EDITOR = editor;
    VISUAL = editor;
    NIXOS_OZONE_WL = "1";
  };

  alacritty = {
    TERM = "xterm-256color";
  };
}

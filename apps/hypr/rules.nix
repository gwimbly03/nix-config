{
    workspace = [
      "1, monitor:eDP-1"
     # "2, monitor:DP-4"
     # "3, monitor:DP-4"
     # "4, monitor:DP-4"
     # "5, monitor:DP-4"

      #"6, monitor:DP-5"
      #"7, monitor:DP-5"
      #"8, monitor:DP-5"
      #"9, monitor:DP-5"
      #"10, monitor:DP-5"
    ];

    windowrule = [
      "workspace 9 match:class steam"
      "workspace 7 match:class feishin"
      "workspace 6 match:class discord"
      "workspace 9, match:class mpv"

      "match:float 1, match:class org\.gnome\.Nautilus"
      "size 875 550, match:class org\.gnome\.Nautilus"
      "match:float 1, match:class mpv"
      
      "rounding 12, match:class org\.gnome\."
      "border_size 0, match:class org\.gnome\."

      "opacity 0.8 0.7, match:class kitty"
      "opacity 0.80 0.80, match:class feishin"
      "opacity 0.80 0.80, match:class discord"
      "opacity 0.95 0.95, match:class brave-browser"
      #"opacity 0.98 override 0.5 override 0.8 override, match:class brave-browser"
      "opacity 1.0 override 0.5 override 0.8 override, match:class alacritty" 
    ];
}




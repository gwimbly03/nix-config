{ serpantinum, ... }:

{
  programs.serpantinum = {
    enable = true;
    systemd.enable = true;

    settings = {
      wallpaperDir = "/home/gwimbly/.nix-config/assets/wallpapers/";

      general = {
        language = "en";
        weatherUnit = "metric";
        weatherInterval = 30;
      };

      bar = {
        position = "top";
        style = "solid";
        width = 40;
        workspaceCount = 10;
        modules = {
          left = [ "workspaces" ];
          center = [ "time" ];
          right = [ "tray" [ "kb" "wifi" "bt" "vol" "bat" ] ];
        };
      };

      theme = {
        fontFamily = "Adwaita Mono";
        borderRadius = 12;
        matugen = true;
      };

      notifications = {
        dnd = false;
        position = "top right";
        sound = true;
      };
    };
  };
}


{
  "bar": {
    "autohide": false,
    "autohideTimeout": 1000,
    "groupColors": {
      "g_kb": "#dfb8f6"
    },
    "modules": {
      "left": [
        "workspaces",
        "media",
        "vis"
      ],
      "center": [
        "time",
        "weather"
      ],
      "right": [
        "tray",
        [
          "wifi",
          "bt",
          "vol",
          "bat"
        ]
      ]
    },
    "opacity": 85,
    "position": "top",
    "style": "modular",
    "time": {
      "format": "HH:mm:ss"
    },
    "width": 100,
    "workspaceCount": 5
  },
  "display": {
    "monitors": {
      "eDP-1": {
        "enabled": false,
        "scale": 1
      },
      "DP-4": {
        "enabled": false,
        "scale": 1
      }
    }
  },
  "general": {
    "avatarPath": "",
    "language": "en",
    "muteSfx": false,
    "weatherInterval": 30,
    "weatherUnit": "metric",
    "sfxVolume": 100,
    "quickactions": true
  },
  "idle": {
    "actions": {
      "dim": {
        "command": "",
        "enabled": true,
        "id": "dim",
        "isCustom": false,
        "mprisInhibit": false,
        "respectInhibitors": true,
        "resumeCommand": "",
        "timeout": 150
      },
      "dpms": {
        "command": "",
        "enabled": true,
        "id": "dpms",
        "isCustom": false,
        "mprisInhibit": false,
        "respectInhibitors": true,
        "resumeCommand": "",
        "timeout": 450
      },
      "lock": {
        "command": "",
        "enabled": true,
        "id": "lock",
        "isCustom": false,
        "mprisInhibit": false,
        "respectInhibitors": true,
        "resumeCommand": "",
        "timeout": 300
      },
      "suspend": {
        "command": "",
        "enabled": false,
        "id": "suspend",
        "isCustom": false,
        "mprisInhibit": false,
        "respectInhibitors": true,
        "resumeCommand": "",
        "timeout": 600
      }
    },
    "enabled": true
  },
  "notifications": {
    "dnd": false,
    "position": "top right",
    "sound": true,
    "soundFile": "/nix/store/zlpnw58c0mvy80af14xh3bz9sbc1khd0-serpantinum-2.0.5/share/serpantinum/assets/sounds/notifications/Botanica.wav"
  },
  "syspanel": {
    "clipExpandProgress": 0,
    "clipExpanded": false,
    "clipState": 1
  },
  "theme": {
    "activePreset": "Matugen",
    "borderRadius": 13,
    "colors": {
      "base": "#1a1b26",
      "blue": "#7aa2f7",
      "crust": "#15161e",
      "green": "#9ece6a",
      "mantle": "#16161e",
      "maroon": "#f7768e",
      "mauve": "#bb9af7",
      "overlay0": "#414868",
      "overlay1": "#565f89",
      "overlay2": "#565f89",
      "peach": "#ff9e64",
      "pink": "#bb9af7",
      "red": "#f7768e",
      "sapphire": "#7dcfff",
      "subtext0": "#a9b1d6",
      "subtext1": "#c0caf5",
      "surface0": "#292e42",
      "surface1": "#292e42",
      "surface2": "#33467c",
      "teal": "#2ac3de",
      "text": "#c0caf5",
      "yellow": "#e0af68"
    },
    "fontFamily": "Mononoki Nerd Font",
    "matugen": true
  },
  "wallpaperDir": "/home/gwimbly/.nix-config/assets/wallpapers/",
  "launcher": {
    "position": "top",
    "width": 600,
    "itemCount": 6,
    "terminalCommand": "alacritty -e",
    "smartRanking": true
  }
}


{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

    # Default search behavior
    defaultCommand = "fd --type f --hidden --follow --exclude .git";

    defaultOptions = [
      "--height=80%"
      "--layout=reverse"
      "--border=rounded"
      "--info=inline"
      "--prompt=❯ "
      "--pointer=▶"
      "--marker=✓"
      "--multi"
      "--cycle"
      "--preview-window=right:50%:wrap"
    ];

    # File picker: CTRL-T
    fileWidget = {
      command = "fd --type f --hidden --follow --exclude .git";

      options = [
        "--preview 'bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || file {}'"
      ];
    };

    # Directory picker: ALT-C
    changeDirWidget = {
      command = "fd --type d --hidden --follow --exclude .git";

      options = [
        "--preview 'lsd --tree --depth 2 --color=always {} 2>/dev/null'"
      ];
    };

    # History search: CTRL-R
    historyWidget = {
      options = [
        "--sort"
        "--exact"
      ];
    };

    # FZF color scheme
    colors = {
      "bg" = "-1";
      "bg+" = "-1";
      "fg" = "7";
      "fg+" = "15";
      "hl" = "4";
      "hl+" = "6";
      "info" = "6";
      "marker" = "2";
      "prompt" = "5";
      "spinner" = "6";
      "pointer" = "5";
      "header" = "6";
      "border" = "8";
      "gutter" = "-1";
    };
  };
}


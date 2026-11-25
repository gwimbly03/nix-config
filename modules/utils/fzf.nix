{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

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

    fileWidget = {
      command = "fd --type f --hidden --follow --exclude .git";
      options = [
        "--preview 'bat --color=always --style=numbers --line-range=:500 {} 2>/dev/null || file {}'"
      ];
    };

    changeDirWidget = {
      command = "fd --type d --hidden --follow --no-ignore --exclude .git";
      options = [
        "--preview 'lsd --tree --depth 2 --color=always {} 2>/dev/null'"
      ];
    };

    historyWidget.options = [
      "--sort"
      "--exact"
    ];
  };
}

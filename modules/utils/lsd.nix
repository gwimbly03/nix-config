{
  programs.lsd = {
    enable = true;
    enableAliases = true;
    lsd.enableFishIntegration = true;

    settings = {
      classic = false;
      blocks = [
        "permission"
        "user"
        "group"
        "size"
        "date"
        "name"
      ];

      color = {
        when = "auto";
        theme = "default";
      };

      icons = {
        when = "auto";
        theme = "fancy";
      };

      layout = "grid";
      size = "default";
      sorting = {
        column = "name";
        reverse = false;
        dir-grouping = "first";
      };
      total-size = false;
      hyperlink = "never";
    };
  };
}


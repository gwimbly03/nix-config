{
  programs.lsd = {
    enable = true;

    settings = {
      classic = false;
      color = {
        when = "auto";
        theme = "default";
      };
      icons = {
        when = "auto";
        theme = "fancy";
      };
      layout = "grid";
      sorting = {
        column = "name";
        reverse = false;
        dir-grouping = "first";
      };
      hyperlink = "never";
    };
  };
}


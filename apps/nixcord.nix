{
  programs.nixcord = {
    enable = true;

    discord = {
      vencord.enable = true;
    };

    vesktop.enable = false;

    config = {
      useQuickCss = true;
      themeLinks = [];
      frameless = true;
    };

    extraConfig = {
      plugins = {
        alwaysAnimate.enable = true;
        readAllNotifications.enable = true;
        fixYoutubeEmbeds.enable = true;

        hideMedia.enable = true;

        ignoreActivities = {
          enable = true;
          ignorePlaying = false;
          ignoreWatching = true;
          ignoredActivities = [];
        };

        fakeNitro = {
          enable = true;
          settings = {
            enableEmojiBypass = true;
            enableStickerBypass = true;
            enableRoleIconBypass = true;
          };
        };

        betterFolders = {
          enable = true;
          settings = {
            closeAllFolders = true;
            sidebar = true;
            folderColor = true;
          };
        };
      };
    };
  };
}


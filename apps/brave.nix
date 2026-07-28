{
  programs.brave-origin = {
    enable = true;
    #package = pkgs.brave-origin;

    extensions = [
      {
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; # ublock origin
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; # dark reader
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "mnjggcdmjocbbbhaepdhchncahnbgone"; # sponsorblock
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "gebbhagfogifgggkldgodflihgfeippi"; # return youtube dislike
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "hipekcciheckooncpjeljhnekcoolahp"; # tabliss
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "nngceckbapebfimnlniiiahkandclblb"; # bitwarden
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
      {
        id = "jghecgabfgfdldnmbfkhmffcabddioke"; # volume master
        updateUrl = "https://clients2.google.com/service/update2/crx";
      }
    ];

    commandLineArgs = [
      "--enable-features=acceleratedvideoencoder,vaapionnvidiagpus,vaapiignoredriverchecks,vulkan,defaultanglevulkan,vulkanfromangle"
      "--enable-features=vaapiignoredriverchecks,vaapivideodecoder,platformhevcdecodersupport"
      "--enable-features=usemultiplaneformatforhardwarevideo"
      "--ignore-gpu-blocklist"
      "--ozone-platform=wayland"
      "--enable-wayland-ime"
      "--force-dark-mode=0" # optional
      "--in-process-gpu"
      "--enable-native-gpu-memory-buffers"
      "--use-system-theme"
      #"--disable-gpu"
    ];
  };
}


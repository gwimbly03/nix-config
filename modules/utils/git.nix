{ uname, ... }: {
  programs.git = {
    enable = true;
    includes = [{ path = "~/.config/git/local.conf"; }];

    signing = {
      signByDefault = true;
    };

    settings = {
      user.name = "towelie03";
      init.defaultBranch = "main";

      commit.gpgSign = true;
      gpg.format = "ssh";

      user.signingkey = "~/.ssh/id_ed25519.pub";
      safe.directory = "/home/${uname}/.nix-config";
    };
  };
}


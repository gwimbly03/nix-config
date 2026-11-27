{ lib, envVars, ... }:

{
  programs.rsi-launcher = {
    # Enables the Star Citizen module
    enable = true;

    # Additional commands before the game starts
    preCommands = lib.concatStringsSep "\n" (
      lib.mapAttrsToList
        (name: value: "export ${name}=${lib.escapeShellArg value}")
        envVars.starCitizen
    );
  };
}

{ pkgs, ... }:

{
  programs.rsi-launcher = {
    enable = true;

    # Commands to run before launching Star Citizen
    preCommands = ''
      export DXVK_HUD=compiler
      export MANGO_HUD=1
    '';

    # Uncomment if you do NOT want automatic sysctl limit changes
    # setLimits = false;
  };
}


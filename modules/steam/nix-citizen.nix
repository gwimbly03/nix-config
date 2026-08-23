{
  programs.rsi-launcher = {
    # Enables the Star Citizen module
    enable = true;

    # Additional commands before the game starts
    preCommands = ''
      export DXVK_HUD=compiler
      export PROTON_ENABLE_NGX_UPDATER="1" 
      export DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE="on"
      export DXVK_NVAPI_DRS_NGX_DLSS_RR_OVERRIDE="on"
      export DXVK_NVAPI_DRS_NGX_DLSS_FG_OVERRIDE="on"
      export DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION="render_preset_latest"
      export DXVK_NVAPI_DRS_NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION="render_preset_latest"

    '';
  };
}


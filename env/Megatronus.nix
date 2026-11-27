let
  wayland = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
  };
in
(import ./env.nix) // {
  system = wayland // {
    QT_QPA_PLATFORMTHEME_QT6 = wayland.QT_QPA_PLATFORMTHEME;
    GDK_SCALE = "1";
    NVD_BACKEND = "direct";
    WLR_NO_HARDWARE_CURSORS = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GSK_RENDERER = "ngl";
  };
  steamSession = {
    SDL_VIDEODRIVER = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  alacritty = {
    TERM = "xterm-256color";
  };

  hyprland = wayland // {
    XCURSOR_SIZE = "24";
    HYPRCURSOR_SIZE = "24";
  };

  starCitizen = {
    DXVK_HUD = "compiler";
    PROTON_ENABLE_NGX_UPDATER = "1";
    DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE = "on";
    DXVK_NVAPI_DRS_NGX_DLSS_RR_OVERRIDE = "on";
    DXVK_NVAPI_DRS_NGX_DLSS_FG_OVERRIDE = "on";
    DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION = "render_preset_latest";
    DXVK_NVAPI_DRS_NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION = "render_preset_latest";
  };
}

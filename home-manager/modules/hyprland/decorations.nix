# decorations.nix
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.hyprland;
in {
  config = mkIf cfg.enable {
    xdg.configFile."hypr/configs/decorations.conf".text = ''
      decoration {
          # Layer rules for blur effects
          layerrule = blur,kitty
          layerrule = blur,rofi
          layerrule = blur,logout_dialog
          layerrule = blur,Spotify
          layerrule = blur,zathura
          layerrule = blur,org.pwmt.zathura
          layerrule = blur,thunar
          layerrule = blur,nautilus
          layerrule = blur,rofi

          # Window opacity
          active_opacity = 0.95
          inactive_opacity = 0.88

          # Shadow configuration
          shadow {
              enabled = false
              range = 7
              render_power = 3
              sharp = false
              ignore_window = true
              color = rgba(0,0,0,0.64)
              offset = 0 0
              scale = 1.0
          }

          # Blur effects
          blur {
              enabled = true
              size = 2
              passes = 3
              noise = 0.0065
              brightness = 0.8
              contrast = 0.8
              vibrancy = 0.1696
          }
      }

      # Uncomment these if needed:
      # exec = export GTK_CSD=0
      # exec = export MOZ_GTK_TITLEBAR_DECORATION=client
    '';
  };
}

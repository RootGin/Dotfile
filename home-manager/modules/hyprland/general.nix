{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.hyprland;
in {
  config = mkIf cfg.enable {
    xdg.configFile."hypr/configs/general.conf".text = ''
      general {
          gaps_in = 0
          gaps_out = 0
          col.active_border = $overlay0
          col.inactive_border = $base
          no_border_on_floating = true
          resize_on_border = true
          allow_tearing = false
          layout = dwindle
      }
    '';
  };
}

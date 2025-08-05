# misc.nix
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.hyprland;
in {
  config = mkIf cfg.enable {
    xdg.configFile."hypr/configs/misc.conf".text = ''
      misc {
          force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = false # If true disables the random hyprland logo / anime girl background. :(
      }
    '';
  };
}

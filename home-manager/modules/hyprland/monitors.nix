# monitors.nix
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.hyprland;
in {
  config = mkIf cfg.enable {
    xdg.configFile."hypr/configs/monitors.conf".text = ''
      # (command to check displays) => hyprctl monitors all
      monitor = eDP-1, addreserved, 0, 0, 0, 0
    '';
  };
}

# env.nix
{ config, lib, pkgs, ... }:
{
  config = lib.mkIf config.modules.hyprland.enable {
    xdg.configFile."hypr/configs/env.conf".text = ''
      env = XCURSOR_SIZE,8
      env = HYPRCURSOR_SIZE,8
      env = QT_QPA_PLATFORM,wayland
      env = SDL_VIDEODRIVER,wayland
      env = CLUTTER_BACKEND,wayland
      env = NIXOS_OZONE_WL,1
      env = XDG_CURRENT_DESKTOP,Hyprland
    '';
  };
}

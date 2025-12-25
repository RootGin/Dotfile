{ config, pkgs, ... }:

{
  # Hyprland configuration
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Wayland portal
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Wayland environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
  };

  # Hyprland applications
  environment.systemPackages = with pkgs; [
    waybar
    rofi
    kitty
    swaylock
    swayidle
    wl-clipboard
    grim
    slurp
  ];
}

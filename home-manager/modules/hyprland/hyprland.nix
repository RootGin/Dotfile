# modules/hyprland/hyprland.nix
{ config, pkgs, ... }:
{
  xdg.configFile."hypr/hyprland.conf".text = ''
    $scripts = ~/.config/hypr/scripts
    $configs = ~/.config/hypr/configs
    $themes = ~/.config/hypr/themes

    exec-once = ${pkgs.kdePackages.xwaylandvideobridge}/bin/xwaylandvideobridge
    exec-once = ${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist store
    exec-once = ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store
    exec-once = systemctl --user import-environment
    exec-once = systemctl --user restart xdg-desktop-portal-hyprland.service
    exec-once = hyprctl setcursor GoogleDot-White 8
    exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland
    exec-once = ${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets,pkcs11,ssh

    # Wallpaper scripts
    # exec-once = $scripts/slideshow.sh

    source = $themes/colors.conf
    source = $configs/animations.conf
    source = $configs/binds.conf
    source = $configs/decorations.conf
    source = $configs/env.conf
    source = $configs/general.conf
    source = $configs/input.conf
    source = $configs/misc.conf
    source = $configs/monitors.conf
    source = $configs/rules.conf
  '';
}

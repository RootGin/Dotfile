{ config, lib, pkgs, ... }:

let
  cfg = config.modules.hyprland;
  assetsDir = "${config.xdg.configHome}/home-manager/assets";
in {
  config = lib.mkIf cfg.enable {
    home.file = {
      # Wallpaper directories (symlinks to assets)
      "${config.home.homeDirectory}/Pictures/Wallpapers/Characters" = {
        source = config.lib.file.mkOutOfStoreSymlink "${assetsDir}/wallpapers/Characters";
        recursive = true;
      };

      "${config.home.homeDirectory}/Pictures/Wallpapers/Simplicity" = {
        source = config.lib.file.mkOutOfStoreSymlink "${assetsDir}/wallpapers/Simplicity";
        recursive = true;
      };

      # Hyprlock assets
      "${config.home.homeDirectory}/Pictures/System/hyprlock-wallpaper.jpg" = {
        source = config.lib.file.mkOutOfStoreSymlink "${assetsDir}/system/hyprlock-wallpaper.jpg";
      };

      "${config.home.homeDirectory}/Pictures/System/hyprlock-profile.png" = {
        source = config.lib.file.mkOutOfStoreSymlink "${assetsDir}/system/hyprlock-profile.png";
      };
    };
  };
}

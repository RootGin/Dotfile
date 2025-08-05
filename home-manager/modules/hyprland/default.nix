{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.modules.hyprland;
  commonPackages = import ../common.nix { inherit pkgs; };
in {
  options.modules.hyprland.enable = lib.mkEnableOption "Hyprland window manager";

  imports = [
    ./config.nix
    ./scripts.nix
    ./themes.nix
    ./binds.nix
    ./animations.nix
    ./decorations.nix
    ./general.nix
    ./input.nix
    ./misc.nix
    ./monitors.nix
    ./rules.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./windowrules.nix
    ./wallpaper.nix
    ./env.nix
  ];

  config = lib.mkIf cfg.enable {
    home.packages = commonPackages ++ [
      inputs.hyprland.packages.${pkgs.system}.default
    ] ++ (with pkgs; [
      hyprpaper
      xfce.thunar
      mpv
      mpvpaper
      swww
      wlr-randr
      kdePackages.xwaylandvideobridge
    ]);
  };
}

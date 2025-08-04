{ config, pkgs, lib, colorScheme, ... }:
{
  imports = [
    ./modules/hyprland
    ./modules/theme
    ./modules/editor
  ];

  home.username = "rootgin";
  home.homeDirectory = "/home/rootgin";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  # Enable modules
  colorScheme = colorScheme;
  modules.hyprland.enable = true;
  theme.enable = true;
  programs.editor = {
    enable = true;
    vscode.enable = true;
  };
}

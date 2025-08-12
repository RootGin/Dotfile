{ config, pkgs, lib, colorScheme, username, host, ... }:
{
  imports = [
    ./modules/hyprland
    ./modules/theme/gtk.nix
    ./modules/editors
    ./modules/browser
    ./modules/programs
    ./modules/terminal
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  # Enable modules
  colorScheme = colorScheme;
  modules.hyprland.enable = true;
  theme.enable = true;
  programs.editors = {
    enable = true;
    vscode.enable = true;
  };
}

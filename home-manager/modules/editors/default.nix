{ config, lib, pkgs, theme, ... }:

with lib;

let
  cfg = config.programs.editors;
in {
  options.programs.editors = {
    enable = mkEnableOption "editor configuration";
    vscode.enable = mkEnableOption "VS Code configuration";
  };

  imports = [
    ./fonts.nix
    ./vscode.nix
  ];
}

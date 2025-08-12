{ config, lib, pkgs, theme, ... }:

with lib;

let
  cfg = config.programs.editor;
in {
  options.programs.editor = {
    enable = mkEnableOption "editor configuration";
    vscode.enable = mkEnableOption "VS Code configuration";
  };

  imports = [
    ./vscode.nix
  ];
}

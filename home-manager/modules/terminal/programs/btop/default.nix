{ config, pkgs, ... }:
let
  theme = config._module.args.theme;
in
{
  home.packages = with pkgs; [ btop ];
  programs.btop = {
    enable = true;
    settings = (import ./settings.nix { inherit theme; }).programs.btop.settings;
    themes = (import ./theme.nix { inherit theme; }).programs.btop.themes;
  };
}

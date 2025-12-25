{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.gaming.wine;
in
{
  options.programs.gaming.wine = {
    enable = mkEnableOption "Wine for Windows games";
    
    winePackage = mkOption {
      type = types.package;
      default = pkgs.wineWowPackages.stable;
      description = "Wine package to use";
    };

    extraPackages = mkOption {
      type = types.listOf types.package;
      default = with pkgs; [
        winetricks
        protontricks
      ];
      description = "Additional Wine-related packages";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wineWowPackages.stable
      wine-staging  # Alternative staging version
    ] ++ cfg.extraPackages;
  };
}

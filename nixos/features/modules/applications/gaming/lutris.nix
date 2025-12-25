{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.gaming.lutris;
in
{
  options.programs.gaming.lutris = {
    enable = mkEnableOption "Lutris game manager";
    
    extraRunners = mkOption {
      type = types.listOf types.package;
      default = with pkgs; [
        lutris-free  
        wineWowPackages.stable
      ];
      description = "Additional Lutris runners";
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lutris
    ] ++ cfg.extraRunners;

    # Lutris dependencies
    programs.steam.enable = mkDefault true;
  };
}

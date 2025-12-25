{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.gaming;
in
{
  imports = [
    ./gaming-base.nix
    ./steam.nix  
    ./minecraft.nix
    ./minecraft-server
#    ./osu.nix
    ./lutris.nix
    ./wine.nix
    ./roblox.nix
  ];

  options.programs.gaming = {
    enable = mkEnableOption "Complete gaming profile";

    # Package options
    extraPackages = mkOption {
      type = types.listOf types.package;
      default = [];
      description = "Additional gaming packages";
    };
  };

  # When programs.gaming.enable = true, all submodules get their defaults
  config = mkIf cfg.enable {
    programs.steam.enable = true;
    programs.gaming.lutris.enable = true;
    programs.gaming.wine.enable = true;
    programs.gaming.minecraft.enable = true;
    programs.gaming.mc-server.enable = true;
    programs.gamemode.enable = true;
    # Add extra packages
    environment.systemPackages = cfg.extraPackages;
  };
}

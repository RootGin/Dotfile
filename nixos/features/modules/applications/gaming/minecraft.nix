{ config, lib, pkgs, ... }:

{
  options.programs.gaming.minecraft = {
    enable = lib.mkEnableOption "PrismLauncher with JDK21";
  };

  config = let
    cfg = config.programs.gaming.minecraft;
  in lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (prismlauncher.override {
        jdks = [ jdk21 ];
      })
    ];

    # System-wide configuration (affects all users)
    environment.etc."prismlauncher/prismlauncher.cfg".text = ''
      [General]
      JavaPath=${pkgs.jdk21}/bin/java
      AutoUpdate=true
    '';
  };
}

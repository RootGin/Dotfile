{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    (prismlauncher.override {
      jdks = [ jdk21 ];
    })
  ];

  xdg.configFile."PrismLauncher/prismlauncher.cfg".text = ''
    [General]
    JavaPath=${pkgs.jdk21}/bin/java
    AutoUpdate=true
  '';
}

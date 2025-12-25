{ config, pkgs, ... }:

let
  obscureTheme = pkgs.stdenv.mkDerivation {
    pname = "obscure-sddm-theme";
    version = "local";

    # Point directly to your local editable folder
    src = ./../../assets/sddm-obscure;

    installPhase = ''
      mkdir -p $out/share/sddm/themes/obscure
      cp -r * $out/share/sddm/themes/obscure
    '';
  };
in {
  environment.systemPackages = [ obscureTheme ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "obscure";
  };
}

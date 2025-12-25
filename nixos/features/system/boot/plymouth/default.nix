{ config, pkgs, ... }:

let
  localPlymouthTheme = pkgs.callPackage ./plymouth.nix {
    theme = "evil-nixos";
  };
in
{
  boot.plymouth = {
    enable = true;
    theme = "evil-nixos";
    themePackages = [ localPlymouthTheme ];
  };

  boot.kernelParams = [ 
    "quiet" 
    "splash" 
    "vt.global_cursor_default=0"
  ];

  boot.initrd.systemd.enable = true;
}

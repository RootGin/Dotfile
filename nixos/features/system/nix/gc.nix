{ config, pkgs, ... }:

{
  nix = {
#    package = pkgs.nixVersions.stable;
    settings = {
#      experimental-features = [ "nix-command" "flakes" ];
#      download-buffer-size = 1048576000;
      auto-optimise-store = true;
    };
    
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
}

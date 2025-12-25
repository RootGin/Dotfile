{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: 
let
  username = config.userOptions.username;
  zenPackage = inputs.zen-browser.packages.${pkgs.system}.beta;
in
{
  options.programs.browsing.zen = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Zen browser.";
    };
  };

  config = lib.mkIf config.programs.browsing.zen.enable {
    environment.systemPackages = [ zenPackage ];
    
    # Don't use the Home Manager module - set up browser manually
    # or create configuration files directly
  };
}

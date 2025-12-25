{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: 
let
  username = config.userOptions.username;
  zenPackage = inputs.zen-browser.packages.${pkgs.system}.specific;
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
    home-manager = {
      users.${username} = {
        programs.zen-browser = {
          enable = true;
          languagePacks = ["en-US"];
          nativeMessagingHosts = [pkgs.firefoxpwa];
          profiles = {
            "default" = {
              # Changed profile name as requested
              id = 0;
              name = "RootGin";
              isDefault = true;
            };  
          };
        };

        imports = [
          ./appearance.nix
          ./extensions.nix
          ./policies.nix
          ./settings.nix
        ];
      };
    };
  };

}

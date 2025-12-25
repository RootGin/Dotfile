{ config, inputs, lib, pkgs, ... }:
let
  username = config.userOptions.username;
in
{
  config = lib.mkIf config.programs.comms.enable {
    home-manager = {
      users.${username} = {
        imports = [
          inputs.nixcord.homeModules.default
          ./plugins.nix
          ./quickCss.nix
        ];
      
        programs.nixcord = {
          enable = true;
          discord.enable = true;
          discord.vencord.unstable = true;
        };
      
        stylix.targets.nixcord.enable = false;
      };
    }; 
  };
}

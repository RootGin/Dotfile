{ config, pkgs, ... }: 

{
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "9bee8941b5f09144" ];
  };
}

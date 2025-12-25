{ config, pkgs, ... }:

{
  imports = [
#    ./vm.nix
    ./modules
    ./system
  ];
}

{ config, pkgs, ... }:

{
  users.users.rootgin = {
    isNormalUser = true;
    description = "RootGin";
    extraGroups = [ "networkmanager" "wheel"];
  };

  programs.firefox.enable = true;
}

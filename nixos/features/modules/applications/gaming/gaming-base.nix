{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.gaming;
in
{
  config = mkIf cfg.enable {
    # Enable gamemode for performance
    programs.gamemode.enable = mkDefault cfg.gamemode.enable;
    
    # Steam hardware support (controllers, etc)
    hardware.steam-hardware.enable = mkDefault true;

    # Udev rules for gaming peripherals
    services.udev.extraRules = ''
      # Thrustmaster T.16000M joystick
      SUBSYSTEM=="hidraw", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b10a", TAG+="uaccess"
      
      # Common gaming controllers
      KERNEL=="uinput", MODE="0660", GROUP="users", OPTIONS+="static_node=uinput"
    '';

    # Gaming-related system packages
    environment.systemPackages = with pkgs; [
      # Performance monitoring
      mangohud
      goverlay
    ];
  };
}

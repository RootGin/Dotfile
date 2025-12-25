# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

{
  imports = [
    ./features
    ./features/desktop/hyprland.nix
  ];
  # Hardware configuration
#  hardware = {
#    graphics.enable = true;
#  };

  # Services
  services = {
    # Desktop services
#    flatpak = {
#      enable = true;
#      update.onActivation = true;
#    };
#    blueman.enable = true;
    
    # Display and desktop
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
    
    # System services
    dbus.enable = true;
  };

  # Programs
  programs.firefox.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    # Add system-wide packages here
    unzip zip
    flameshot
    rofi tree
    wlogout git
  ];
}

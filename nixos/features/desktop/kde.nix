{ config, pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  
  # Enable SDDM display manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kate
    kdePackages.ark
  ];
}

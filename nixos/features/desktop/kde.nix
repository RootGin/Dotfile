{ config, pkgs, ... }:

{
  # Enable Plasma 6
  services.desktopManager.plasma6.enable = true;
  
  # Enable SDDM display manager
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;  # For Wayland support
  };

  # Optional: Add core KDE applications
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.kate
    kdePackages.ark
  ];
}

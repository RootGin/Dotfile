{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./features/nix.nix
    ./features/boot.nix
    ./features/networking.nix
    ./features/locale.nix
    ./features/users.nix
    ./features/sound.nix
    ./features/printer.nix
    
    ./features/desktop/kde.nix
    ./features/desktop/hyprland.nix
  ];

  nixpkgs.config.allowUnfree = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
  };

  system.stateVersion = "25.05";
}

{ pkgs, ... }:

{
  # Bootloader.
  boot = {
    loader = {
      timeout = 30;
      systemd-boot.enable = false;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
	  enable = true;
	  device = "nodev";
	  useOSProber = true;
  	  efiSupport = true;
      };
    };
   
  };

  boot.initrd.systemd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
}

{ pkgs, ... }:

{
  boot = {
    # Basic boot settings
    consoleLogLevel = 0;
    kernelPackages = pkgs.linuxPackages_latest;
    
    # Bootloader configuration
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
      timeout = 30;
    };
    
    kernelParams = [
      "quiet"
      "loglevel=3"
      "splash"
      "nowatchdog"
    ];
    
    # Plymouth configuration (simple theme)
    plymouth = {
      enable = true;
      theme = "breeze";
    };
    
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
  };
  
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usbhid"
    "sd_mod"
  ];
  
  boot.supportedFilesystems = ["ntfs" "btrfs" "ext4" "vfat"];
}

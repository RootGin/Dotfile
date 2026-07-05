{ self, inputs, ... }:
{
  flake.nixosModules.modulesDesktop =
    { config, pkgs, ... }:
    let
      username = config.userOptions.username;
    in
    {
      imports = [
        self.nixosModules.modulesDesktopEww
        self.nixosModules.modulesDesktopHypr
        self.nixosModules.modulesDesktopWaybar
        self.nixosModules.modulesDesktopLy
        self.nixosModules.modulesDesktopStylix
        self.nixosModules.modulesDesktopXdg
        # inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
        inputs.home-manager.nixosModules.home-manager
      ];
    };
}

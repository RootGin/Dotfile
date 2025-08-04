{
  description = "Home Manager configuration with Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, nix-colors, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      colorScheme = nix-colors.colorSchemes.nord;
    in {
      homeConfigurations.rootgin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./modules/hyprland
          ./modules/theme
          ./modules/editor
          nix-colors.homeManagerModules.default
        ];
        extraSpecialArgs = {
          inherit inputs hyprland nix-colors colorScheme;
          assetsDir = ./assets;
        };
      };
    };
}

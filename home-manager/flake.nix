{
  description = "Home Manager configuration with Hyprland";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-colors, zen-browser, nur, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          packageOverrides = pkgs: {
            nur = import nur { inherit pkgs; };
          };
        };
      };
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
          inherit inputs nix-colors zen-browser colorScheme system;
          assetsDir = ./assets;
          username = "rootgin";
          host = "nixos";
        };
      };
    };
}

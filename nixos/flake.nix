{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nix-flatpak.url = "github:gmodena/nix-flatpak/v0.6.0";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium = {
      url = "github:FKouhai/helium2nix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#    playit-nixos-module = {
#      url = "github:pedorich-n/playit-nixos-module";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = { 
        Laptop = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs; } // inputs;
          modules = [
            ./hosts/Laptop
            ./configuration.nix
            ./.
          ];
        };
       
        Desktop = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system; } // inputs;
          modules = [
            ./hosts/Desktop
            ./.
          ];
        };
      };
      formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}

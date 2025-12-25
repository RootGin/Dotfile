{
  inputs,
  nixpkgs, 
  nix-flatpak,
  agenix,
  home-manager,
  stylix,
  nix-minecraft,
  ...
}:
{
  imports = [
    agenix.nixosModules.default
    home-manager.nixosModules.home-manager
    stylix.nixosModules.stylix
    nix-flatpak.nixosModules.nix-flatpak
    nix-minecraft.nixosModules.minecraft-servers 
    { nixpkgs.overlays = [ inputs.nix-minecraft.overlay ]; }
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
  };
}

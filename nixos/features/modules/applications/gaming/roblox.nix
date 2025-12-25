# Inside your configuration.nix
{ config, ... }:
{
  services.flatpak = {
    packages = [ 
      "org.vinegarhq.Sober"
    ];
  };
}

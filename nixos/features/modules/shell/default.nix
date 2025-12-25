{ config, pkgs, ... }:
let
  username = config.userOptions.username;
in
{
  imports = [
    ./bash.nix
    ./p10k
    ./zsh.nix
  ];

  home-manager.users.${username} = {
    programs.git = {
      enable = true;
      settings.user = {
        name = "rootgin";
        email = "divinenoterealm0@gmail.com";
      };
      #signing = {
      #  key = "4998F4C236F92A36";
      #  signByDefault = true;
      #};
    };
  };
  environment.systemPackages = with pkgs; [
    acpi
    bat
    bat-extras.batman
    clang
    eza
    gh
    glow
    nixd
    nixfmt-rfc-style
    unzip
    zoxide
  ];
}

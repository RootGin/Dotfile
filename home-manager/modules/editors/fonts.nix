{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    fira-code
    jetbrains-mono
    font-awesome
    terminus_font
    nerd-fonts.fira-code
  ];
}

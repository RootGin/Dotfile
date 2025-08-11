{ config, pkgs, ... }:
let
  theme = config._module.args.theme;
in
{
  gtk = {
    enable = true;
    theme = {
      name = theme.gtkThemeName;
      package = theme.gtkThemePackage;
    };
    iconTheme = {
      name = theme.iconThemeName;
      package = theme.iconThemePackage;
    };
    font = {
      name = theme.fontName;
      size = theme.fontSize;
      package = theme.fontPackage;
    };
  };
}

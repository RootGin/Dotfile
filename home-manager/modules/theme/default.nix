{ config, lib, pkgs, colorScheme, inputs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  colors = colorScheme.palette;

  fonts = {
    fontPackage = pkgs.noto-fonts;
    fontName = "Noto Sans";
    fontSize = 11;
    monoFontPackage = pkgs.noto-fonts;
    monoFontName = "Noto Sans Mono";
    monoFontSize = 10;
  };

  hexToRGB = hex: inputs.nix-colors.lib.conversions.hexToRGBString "," hex;

  theme = rec {
    colorScheme = {
      transparencyBackgroundHex = "CC";
      transparencyForegroundHex = "EE";
      transparencyHeavyShadeHex = "5C";
      transparencyLightShadeHex = "14";

      transparencyBackgroundRGB = "0.8";
      transparencyForegroundRGB = "0.93";
      transparencyHeavyShadeRGB = "0.36";
      transparencyLightShadeRGB = "0.08";

      background1Hex = colors.base00;
      background2Hex = colors.base01;
      background3Hex = colors.base02;
      background4Hex = colors.base03;
      foreground4Hex = colors.base04;
      foreground3Hex = colors.base05;
      foreground2Hex = colors.base06;
      foreground1Hex = colors.base07;

      background1RGB = hexToRGB colors.base00;
      background2RGB = hexToRGB colors.base01;
      background3RGB = hexToRGB colors.base02;
      background4RGB = hexToRGB colors.base03;
      foreground4RGB = hexToRGB colors.base04;
      foreground3RGB = hexToRGB colors.base05;
      foreground2RGB = hexToRGB colors.base06;
      foreground1RGB = hexToRGB colors.base07;

      redHex = colors.base08;
      orangeHex = colors.base09;
      yellowHex = colors.base0A;
      greenHex = colors.base0B;
      cyanHex = colors.base0C;
      blueHex = colors.base0D;
      magentaHex = colors.base0E;
      brownHex = colors.base0F;

      redRGB = hexToRGB colors.base08;
      orangeRGB = hexToRGB colors.base09;
      yellowRGB = hexToRGB colors.base0A;
      greenRGB = hexToRGB colors.base0B;
      cyanRGB = hexToRGB colors.base0C;
      blueRGB = hexToRGB colors.base0D;
      magentaRGB = hexToRGB colors.base0E;
      brownRGB = hexToRGB colors.base0F;

      accentHex = theme.colorScheme.cyanHex;
      secondaryAccentHex = theme.colorScheme.greenHex;
      dangerHex = theme.colorScheme.redHex;
      warningHex = theme.colorScheme.yellowHex;
      infoHex = theme.colorScheme.blueHex;
      successHex = theme.colorScheme.greenHex;
      specialHex = theme.colorScheme.magentaHex;

      accentRGB = theme.colorScheme.cyanRGB;
      secondaryAccentRGB = theme.colorScheme.greenRGB;
      dangerRGB = theme.colorScheme.redRGB;
      warningRGB = theme.colorScheme.yellowRGB;
      infoRGB = theme.colorScheme.blueRGB;
      successRGB = theme.colorScheme.greenRGB;
      specialRGB = theme.colorScheme.magentaRGB;

      newtForeground = "white";
      newtBackground = "black";
      newtAccent = "cyan";
    };

    cursorThemePackage = pkgs.google-cursor;
    cursorThemeName = "GoogleDot-White";
    cursorSize = 8;

    fontPackage = pkgs.noto-fonts;
    fontName = "Noto Sans";
    fontSize = 11;
    fontSizeUI = 16;
    monoFontPackage = pkgs.noto-fonts;
    monoFontName = "Noto Sans Mono";
    monoFontSize = 10;

    iconThemePackage = pkgs.nordzy-icon-theme;
    iconThemeName = "Nordzy";

    gtkThemePackage = pkgs.nordic;
    gtkThemeName = "Nordic";
  };

in {
  options.theme = {
    enable = mkEnableOption "Nord theme configuration";
    fontPackage = lib.mkOption { default = fonts.fontPackage; };
    fontName = lib.mkOption { default = fonts.fontName; };
    fontSize = lib.mkOption { default = fonts.fontSize; };
    monoFontPackage = lib.mkOption { default = fonts.monoFontPackage; };
    monoFontName = lib.mkOption { default = fonts.monoFontName; };
    monoFontSize = lib.mkOption { default = fonts.monoFontSize; };
  };

  config = lib.mkIf config.theme.enable {
    home.pointerCursor = {
      package = theme.cursorThemePackage;
      name = theme.cursorThemeName;
      size = theme.cursorSize;
      gtk.enable = true;
      x11.enable = true;
    };

    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      theme.fontPackage
      theme.monoFontPackage
      theme.cursorThemePackage
      theme.iconThemePackage
      theme.gtkThemePackage
    ];

    _module.args.theme = theme;
  };
}

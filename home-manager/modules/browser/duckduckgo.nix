{ config, ... }:
let
  theme = config._module.args.theme;
in
{
  home.file.".config/stylus/duckduckgo-nord.css" = {
    text = ''
      @-moz-document domain("duckduckgo.com") {
        body, .site-wrapper {
          background-color: ${theme.colorScheme.background1Hex} !important;
          color: ${theme.colorScheme.foreground3Hex} !important;
        }
        .search__input, .search__button {
          background-color: ${theme.colorScheme.background2Hex} !important;
          color: ${theme.colorScheme.foreground3Hex} !important;
          border-color: ${theme.colorScheme.greenHex} !important;
        }
        .search__button:hover {
          background-color: ${theme.colorScheme.greenHex} !important;
          color: ${theme.colorScheme.background1Hex} !important;
        }
        .results--main, .result__body {
          background-color: ${theme.colorScheme.background1Hex} !important;
          color: ${theme.colorScheme.foreground3Hex} !important;
        }
        .result__title a, .result__url {
          color: ${theme.colorScheme.greenHex} !important;
        }
        .result__title a:hover {
          color: ${theme.colorScheme.yellowHex} !important;
        }
      }
    '';
  };
}

{ config, path, highlightColor, ... }:
let
  theme = config._module.args.theme;
  c = theme.colorScheme;
  hex = color: "#${color}";
in
{
  home.file.".zen/${path}/chrome/userContent.css" = {
    text = ''
      @media (prefers-color-scheme: dark) {
        @-moz-document url-prefix("about:") {
          :root {
            --in-content-page-color: ${hex c.foreground1Hex} !important;
            --color-accent-primary: ${hex c.accentHex} !important;
            --color-accent-primary-hover: ${hex c.cyanHex} !important;
            --color-accent-primary-active: ${hex c.blueHex} !important;
            background-color: ${hex c.background2Hex} !important;
            --in-content-page-background: ${hex c.background2Hex} !important;
          }
        }

        /* Styling the about:newtab and about:home */
        @-moz-document url("about:newtab"), url("about:home") {
          :root {
            --newtab-background-color: ${hex c.background2Hex} !important;
            --newtab-background-color-secondary: ${hex c.background3Hex} !important;
            --newtab-element-hover-color: ${hex c.background3Hex} !important;
            --newtab-text-primary-color: ${hex c.foreground1Hex} !important;
            --newtab-wordmark-color: ${hex c.foreground1Hex} !important;
            --newtab-primary-action-background: ${hex c.accentHex} !important;
          }

          .icon {
            color: ${hex c.accentHex} !important;
          }

          .search-wrapper .logo-and-wordmark .logo {
            background: url("zen-logo-nordic.svg") no-repeat center !important;
            display: inline-block !important;
            height: 82px !important;
            width: 82px !important;
            background-size: 82px !important;
          }

          @media (max-width: 609px) {
            .search-wrapper .logo-and-wordmark .logo {
              background-size: 64px !important;
              height: 64px !important;
              width: 64px !important;
            }
          }

          .card-outer:is(:hover, :focus, .active):not(.placeholder) .card-title {
            color: ${hex c.accentHex} !important;
          }

          .top-site-outer .search-topsite {
            background-color: ${hex c.accentHex} !important;
          }

          .compact-cards .card-outer .card-context .card-context-icon.icon-download {
            fill: ${hex c.greenHex} !important;
          }
        }

        @-moz-document url-prefix("about:preferences") {
          :root {
            --zen-colors-tertiary: ${hex c.background1Hex} !important;
            --in-content-text-color: ${hex c.foreground1Hex} !important;
            --link-color: ${hex c.accentHex} !important;
            --link-color-hover: ${hex c.cyanHex} !important;
            --zen-colors-primary: ${hex c.background3Hex} !important;
            --in-content-box-background: ${hex c.background3Hex} !important;
            --zen-primary-color: ${hex c.accentHex} !important;
          }

          groupbox,
          moz-card {
            background: ${hex c.background2Hex} !important;
          }

          button,
          groupbox menulist {
            background: ${hex c.background3Hex} !important;
            color: ${hex c.foreground1Hex} !important;
          }

          .main-content {
            background-color: ${hex c.background1Hex} !important;
          }
        }

        @-moz-document url-prefix("about:protections") {
          :root {
            --zen-primary-color: ${hex c.background2Hex} !important;
            --social-color: ${hex c.magentaHex} !important;
            --coockie-color: ${hex c.cyanHex} !important;
            --fingerprinter-color: ${hex c.yellowHex} !important;
            --cryptominer-color: ${hex c.accentHex} !important;
            --tracker-color: ${hex c.greenHex} !important;
            --in-content-primary-button-background-hover: ${hex c.background4Hex} !important;
            --in-content-primary-button-text-color-hover: ${hex c.foreground1Hex} !important;
            --in-content-primary-button-background: ${hex c.background3Hex} !important;
            --in-content-primary-button-text-color: ${hex c.foreground1Hex} !important;
          }

          .card {
            background-color: ${hex c.background3Hex} !important;
          }
        }

        @-moz-document url-prefix("about:addons") {
          :root {
            --zen-dark-color-mix-base: ${hex c.background1Hex} !important;
            --background-color-box: ${hex c.background2Hex} !important;
          }
        }
      }
    '';
  };
}

{ config, path, highlightColor, ... }:
let
  theme = config._module.args.theme;
  c = theme.colorScheme;
  hex = color: "#${color}";
in
{
  home.file.".zen/${path}/chrome/userChrome.css" = {
    text = ''
      @media (prefers-color-scheme: dark) {
        :root {
          --zen-colors-primary: ${hex c.background3Hex} !important;
          --zen-primary-color: ${hex c.accentHex} !important;
          --zen-colors-secondary: ${hex c.background3Hex} !important;
          --zen-colors-tertiary: ${hex c.background1Hex} !important;
          --zen-colors-border: ${hex c.accentHex} !important;
          --toolbarbutton-icon-fill: ${hex c.accentHex} !important;
          --lwt-text-color: ${hex c.foreground1Hex} !important;
          --toolbar-field-color: ${hex c.foreground1Hex} !important;
          --tab-selected-textcolor: ${hex c.accentHex} !important;
          --toolbar-field-focus-color: ${hex c.foreground1Hex} !important;
          --toolbar-color: ${hex c.foreground1Hex} !important;
          --newtab-text-primary-color: ${hex c.foreground1Hex} !important;
          --arrowpanel-color: ${hex c.foreground1Hex} !important;
          --arrowpanel-background: ${hex c.background2Hex} !important;
          --sidebar-text-color: ${hex c.foreground1Hex} !important;
          --lwt-sidebar-text-color: ${hex c.foreground1Hex} !important;
          --lwt-sidebar-background-color: ${hex c.background1Hex} !important;
          --toolbar-bgcolor: ${hex c.background3Hex} !important;
          --newtab-background-color: ${hex c.background2Hex} !important;
          --zen-themed-toolbar-bg: ${hex c.background1Hex} !important;
          --zen-main-browser-background: ${hex c.background1Hex} !important;
          --toolbox-bgcolor-inactive: ${hex c.background1Hex} !important;
        }

        #permissions-granted-icon {
          color: ${hex c.background1Hex} !important;
        }

        .sidebar-placesTree,
        #zen-workspaces-button,
        #urlbar-background,
        .content-shortcuts {
          background-color: ${hex c.background2Hex} !important;
          border-color: ${hex c.accentHex} !important;
        }
        /* Style the url view bar */
        .urlbarView-url {
          color: ${hex c.accentHex} !important;
        }

        #zenEditBookmarkPanelFaviconContainer {
          background: ${hex c.background1Hex} !important;
        }

        #TabsToolbar,
        hbox#titlebar,
        #zen-appcontent-navbar-container {
          background-color: ${hex c.background1Hex} !important;
        }
        /* bruh i suck at comment writing so im not gonna write anymore */
        #zen-media-controls-toolbar #zen-media-progress-bar::-moz-range-track {
          background: ${hex c.background3Hex} !important;
        }

        toolbar
          .toolbarbutton-1:not([disabled]):is([open], [checked])
          > :is(
            .toolbarbutton-icon,
            .toolbarbutton-text,
            .toolbarbutton-badge-stack
          ) {
          fill: ${hex c.background1Hex} !important;
        }
        tooltip,
        #tooltip,
        #main-window tooltip {
          background-color: ${hex c.background2Hex} !important; /* Theme secondary background */
          color: ${hex c.foreground1Hex} !important; /* Theme text color */
          border: 1px solid ${hex c.accentHex} !important; /* Theme accent border */
          font-family: "Segoe UI", sans-serif !important;
          font-size: 13px !important;
          padding: 4px 8px !important;
          border-radius: 4px !important;
        }

        .arrowpanel-menuitem,
        .panel-subview-body,
        .panel-header,
        .panel-footer,
        .panel-button {
          background-color: ${hex c.background2Hex} !important;
          color: ${hex c.foreground1Hex} !important;
          border: none !important;
        }

        .arrowpanel-menuitem:hover,
        .panel-button:hover {
          background-color: ${hex c.background3Hex} !important;
          color: ${hex c.foreground1Hex} !important;
        }

        .identity-color-blue {
          --identity-tab-color: ${hex c.accentHex} !important;
          --identity-icon-color: ${hex c.accentHex} !important;
        }

        .identity-color-turquoise {
          --identity-tab-color: ${hex c.cyanHex} !important;
          --identity-icon-color: ${hex c.cyanHex} !important;
        }

        .identity-color-green {
          --identity-tab-color: ${hex c.greenHex} !important;
          --identity-icon-color: ${hex c.greenHex} !important;
        }

        .identity-color-yellow {
          --identity-tab-color: ${hex c.yellowHex} !important;
          --identity-icon-color: ${hex c.yellowHex} !important;
        }

        .identity-color-orange {
          --identity-tab-color: ${hex c.orangeHex} !important;
          --identity-icon-color: ${hex c.orangeHex} !important;
        }

        .identity-color-red {
          --identity-tab-color: ${hex c.redHex} !important;
          --identity-icon-color: ${hex c.redHex} !important;
        }

        .identity-color-pink {
          --identity-tab-color: ${hex c.foreground1Hex} !important;
          --identity-icon-color: ${hex c.foreground1Hex} !important;
        }

        .identity-color-purple {
          --identity-tab-color: ${hex c.magentaHex} !important;
          --identity-icon-color: ${hex c.magentaHex} !important;
        }
      }
    '';
  };
}

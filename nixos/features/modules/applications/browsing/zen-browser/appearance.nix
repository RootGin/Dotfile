{ config, ... }:
let
  # Access Stylix colors - these will match YOUR current theme
  c = config.lib.stylix.colors;

  # Build CSS with your actual Stylix colors
  userChromeCss = ''
    @media (prefers-color-scheme: dark) {
      :root {
        /* Primary colors */
        --zen-colors-primary: #${c.base01} !important;
        --zen-primary-color: #${c.base08} !important;
        --zen-colors-secondary: #${c.base01} !important;
        --zen-colors-tertiary: #${c.base00} !important;
        --zen-colors-border: #${c.base08} !important;
        
        /* Text and UI colors */
        --toolbarbutton-icon-fill: #${c.base08} !important;
        --lwt-text-color: #${c.base05} !important;
        --toolbar-field-color: #${c.base05} !important;
        --tab-selected-textcolor: #${c.base0E} !important;
        --toolbar-field-focus-color: #${c.base05} !important;
        --toolbar-color: #${c.base05} !important;
        --newtab-text-primary-color: #${c.base05} !important;
        --arrowpanel-color: #${c.base05} !important;
        
        /* Background colors */
        --arrowpanel-background: #${c.base01} !important;
        --sidebar-text-color: #${c.base05} !important;
        --lwt-sidebar-text-color: #${c.base05} !important;
        --lwt-sidebar-background-color: #${c.base00} !important;
        --toolbar-bgcolor: #${c.base01} !important;
        --newtab-background-color: #${c.base01} !important;
        --zen-themed-toolbar-bg: #${c.base00} !important;
        --zen-main-browser-background: #${c.base00} !important;
        --toolbox-bgcolor-inactive: #${c.base00} !important;
      }

      /* Element-specific backgrounds */
      #permissions-granted-icon {
        color: #${c.base00} !important;
      }

      .sidebar-placesTree {
        background-color: #${c.base01} !important;
      }

      #zen-workspaces-button {
        background-color: #${c.base01} !important;
      }

      #TabsToolbar {
        background-color: #${c.base00} !important;
      }

      #urlbar-background {
        background-color: #${c.base01} !important;
      }

      .content-shortcuts {
        background-color: #${c.base01} !important;
        border-color: #${c.base08} !important;
      }

      .urlbarView-url {
        color: #${c.base08} !important;
      }

      #zenEditBookmarkPanelFaviconContainer {
        background: #${c.base00} !important;
      }

      /* Identity colors - mapped from your original */
      .identity-color-blue {
        --identity-tab-color: #${c.base0D} !important;
        --identity-icon-color: #${c.base0D} !important;
      }

      .identity-color-turquoise {
        --identity-tab-color: #${c.base0C} !important;
        --identity-icon-color: #${c.base0C} !important;
      }

      .identity-color-green {
        --identity-tab-color: #${c.base0B} !important;
        --identity-icon-color: #${c.base0B} !important;
      }

      .identity-color-yellow {
        --identity-tab-color: #${c.base0A} !important;
        --identity-icon-color: #${c.base0A} !important;
      }

      .identity-color-orange {
        --identity-tab-color: #${c.base09} !important;
        --identity-icon-color: #${c.base09} !important;
      }

      .identity-color-red {
        --identity-tab-color: #${c.base08} !important;
        --identity-icon-color: #${c.base08} !important;
      }

      .identity-color-pink {
        --identity-tab-color: #${c.base0E} !important;
        --identity-icon-color: #${c.base0E} !important;
      }

      .identity-color-purple {
        --identity-tab-color: #${c.base0F} !important;
        --identity-icon-color: #${c.base0F} !important;
      }

      /* Additional element backgrounds */
      hbox#titlebar {
        background-color: #${c.base00} !important;
      }

      #zen-appcontent-navbar-container {
        background-color: #${c.base00} !important;
      }
    }
  '';

  # Similarly create userContent.css with Stylix colors
  userContentCss = ''
    @media (prefers-color-scheme: dark) {
      /* Common variables affecting all pages */
      @-moz-document url-prefix("about:") {
        :root {
          --in-content-page-color: #${c.base05} !important;
          --color-accent-primary: #${c.base08} !important;
          --color-accent-primary-hover: #${c.base08}80 !important;
          --color-accent-primary-active: #${c.base08}40 !important;
          background-color: #${c.base01} !important;
          --in-content-page-background: #${c.base01} !important;
        }
      }

      /* about:newtab and about:home */
      @-moz-document url("about:newtab"), url("about:home") {
        :root {
          --newtab-background-color: #${c.base01} !important;
          --newtab-background-color-secondary: #${c.base02} !important;
          --newtab-element-hover-color: #${c.base02} !important;
          --newtab-text-primary-color: #${c.base05} !important;
          --newtab-wordmark-color: #${c.base05} !important;
          --newtab-primary-action-background: #${c.base08} !important;
        }

        .icon {
          color: #${c.base08} !important;
        }

        .top-site-outer .search-topsite {
          background-color: #${c.base0D} !important;
        }

        .compact-cards .card-outer .card-context .card-context-icon.icon-download {
          fill: #${c.base0B} !important;
        }
      }

      /* about:preferences */
      @-moz-document url-prefix("about:preferences") {
        :root {
          --zen-colors-tertiary: #${c.base00} !important;
          --in-content-text-color: #${c.base05} !important;
          --link-color: #${c.base08} !important;
          --link-color-hover: #${c.base08}80 !important;
          --zen-colors-primary: #${c.base01} !important;
          --in-content-box-background: #${c.base01} !important;
          --zen-primary-color: #${c.base08} !important;
        }

        groupbox, moz-card {
          background: #${c.base01} !important;
        }

        button,
        groupbox menulist {
          background: #${c.base01} !important;
          color: #${c.base05} !important;
        }

        .main-content {
          background-color: #${c.base00} !important;
        }
      }
    }
  '';
in
{
  programs.zen-browser.profiles.default = {
    userChrome = userChromeCss;
    userContent = userContentCss;
  };
}

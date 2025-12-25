{ config, lib, pkgs, inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  options.programs.browsing.zen = {
    enable = lib.mkEnableOption "Zen Browser";

    package = lib.mkOption {
      type = lib.types.nullOr lib.types.package;
      default = inputs.zen-browser.packages.${pkgs.system}.specific;  # Use .generic or .avx2 if preferred
      example = lib.literalExpression "inputs.zen-browser.packages.${pkgs.system}.specific";
      description = "The Zen package to use (from zen-browser flake).";
    };
  };

  config = lib.mkIf config.programs.browsing.zen.enable {
    home.packages = [
      (config.programs.browsing.zen.package or pkgs.zen-browser)  # Fallback if not set
    ];

    programs.zen-browser = {
      enable = true;
      languagePacks = ["en-US"];
      nativeMessagingHosts = [pkgs.firefoxpwa];

      profiles = {
        default = {
          id = 0;
          name = "RootGin";
          isDefault = true;

          settings = {
            "ui.systemUsesDarkTheme" = 1;
            "browser.theme.content-theme" = 0;
            "browser.theme.toolbar-theme" = 0;
            "browser.download.useDownloadDir" = false;
            "browser.download.dir" = "${config.home.homeDirectory}/Downloads";
            "general.autoScroll" = true;
            "general.smoothScroll" = true;
            "mousewheel.default.delta_multiplier_y" = 100;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.search.defaultenginename" = "ecosia";
            "browser.search.order.1" = "ecosia";
            "browser.tabs.warnOnClose" = false;
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_pbm" = true;
          };

          userChrome = let
            c = config.lib.stylix.colors;
          in ''
            @media (prefers-color-scheme: dark) {
              :root {
                --zen-colors-primary: #${c.base01} !important;
                --zen-primary-color: #${c.base08} !important;
                --zen-colors-secondary: #${c.base01} !important;
                --zen-colors-tertiary: #${c.base00} !important;
                --zen-colors-border: #${c.base08} !important;
                
                --toolbarbutton-icon-fill: #${c.base08} !important;
                --lwt-text-color: #${c.base05} !important;
                --toolbar-field-color: #${c.base05} !important;
                --tab-selected-textcolor: #${c.base0E} !important;
                --toolbar-field-focus-color: #${c.base05} !important;
                --toolbar-color: #${c.base05} !important;
                --newtab-text-primary-color: #${c.base05} !important;
                --arrowpanel-color: #${c.base05} !important;
                
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

          userContent = let
            c = config.lib.stylix.colors;
          in ''
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
        };
      };

      policies = {
        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        HardwareAcceleration = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        Preferences = {
          "browser.tabs.warnOnClose" = {
            Value = false;
            Status = "locked";
          };
        };
        Permissions = {
          Location = {
            BlockNewRequests = true;
            Locked = true;
          };
        };

        ExtensionSettings = {
          "*".installation_mode = "blocked";

          # Wappalyzer
          "wappalyzer@crunchlabz.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "menupanel";
          };

          # Github file icon
          "{85860b32-02a8-431a-b2b1-40fbd64c9c69}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/github-file-icons/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "menupanel";
          };

          # uBlock Origin
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };

          # Privacy Badger
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };

          # ClearURLs
          "{74145f27-f039-47ce-a470-a662b129930a}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/clearurls/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };

          # Decentraleyes
          "jid1-BoFifL9Vbdl2zQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/decentraleyes/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };

          # SponsorBlock
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "menupanel";
          };

          # Return YouTube Dislike
          "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "menupanel";
          };

          # Improve YouTube!
          "{3c6bf0cc-3ae2-42fb-9993-0d33104fdcaf}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-addon/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "menupanel";
          };

          # Search by Image
          "{2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/search_by_image/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "menupanel";
          };

          # Dictionary Anywhere
          "{e90f5de4-8510-4515-9f67-3b6654e1e8c2}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/dictionary-anyvhere/latest.xpi";
            installation_mode = "force_installed";
            default_area = "menupanel";
          };

          # I still don't care about cookies
          "idcac-pub@guus.ninja" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi";
            installation_mode = "normal_installed";
            default_area = "menupanel";
          };
        };
      };
    };
  };
}

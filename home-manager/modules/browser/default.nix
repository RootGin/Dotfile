{
  inputs,
  config,
  pkgs,
  username,
  host,
  system,
  ...
}:
let
  path = "${username}.${host}";
  theme = config._module.args.theme;
  highlightColor = theme.colorScheme.greenHex;
in
{
  imports = [
    (import ./chrome.nix { inherit config path highlightColor; })
    (import ./content.nix { inherit config path highlightColor; })
    (import ./user.nix { inherit path; })
    (import ./duckduckgo.nix { inherit config; })
  ];

  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".specific
  ];

  programs.firefox = {
    enable = true;
    profiles.default = {
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "https://duckduckgo.com";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.order.1" = "DuckDuckGo";
        "browser.search.suggest.enabled" = true;
        "browser.urlbar.showSearchSuggestionsFirst" = true;
        "zen.urlbar.replace-newtab" = true;
        "font.name.sans-serif.x-western" = "Noto Sans";
        "font.name.monospace.x-western" = "Noto Sans Mono";
      };
#       extensions.packages = with pkgs.firefox-addons; [
#         ublock-origin
#         vimium-c
#         darkreader
#         stylus
#       ];
    };
  };

  home.file.".zen/profiles.ini" = {
    text = ''
      [General]
      StartWithLastProfile=1
      Version=2

      [Profile0]
      Name=${username}
      IsRelative=1
      Path=${path}
      ZenAvatarPath=chrome://browser/content/zen-avatars/avatar-53.svg
      Default=1
    '';
  };
}

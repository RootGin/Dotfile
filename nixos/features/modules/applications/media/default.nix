{
  config,
  lib,
  system,
  pkgs,
  spicetify-nix,
  ...
}:
let
  username = config.userOptions.username;
  spicePkgs = spicetify-nix.legacyPackages.${system};
in
{
  imports = [ spicetify-nix.nixosModules.default ];

  options.programs.media = {
    enable = lib.mkEnableOption "Enables communication module";
  };

  config = lib.mkIf config.programs.media.enable {
    stylix.targets.spicetify.enable = false;
    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.text;
      colorScheme = "Nord";
      enabledSnippets = with spicePkgs.snippets; [
        autoHideFriends
        removePopular
        hideMadeForYou
        removeConnectBar
        hideDownloadButton
        hideNowPlayingViewButton
        hideProfileUsername
        ''
          section[data-testid='home-page'] .main-shelf-shelf:not([aria-label='Recently played'], [aria-label='Your playlists']) {
          display: none !important;
          }
        ''
      ];
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        powerBar
        history
        shuffle
        fullAppDisplay
        playNext
        volumePercentage
        writeify
      ];
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        lyricsPlus
        betterLibrary
        historyInSidebar
      ];
    };

    home-manager.users.${username}.home.packages = with pkgs; [
      vlc
    ];
  };
}

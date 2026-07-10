{ self, inputs, ... }:
{
  flake.nixosModules.modulesDesktopStylix =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      inherit (config.userOptions) colorScheme;
      fontDir = ../../../assets/fonts;
    in
    {
      imports = [
        inputs.stylix.nixosModules.stylix
      ];

      fonts = {
        packages = [
          (pkgs.runCommand "be-vietnam-pro"
            {
              meta = {
                description = "Be Vietnam Pro - Neo Grotesk typeface";
                homepage = "https://fonts.google.com/specimen/Be+Vietnam+Pro";
                license = lib.licenses.ofl;
              };
            }
            ''
              mkdir -p $out/share/fonts/truetype/be-vietnam-pro
              ln -s ${fontDir}/*.ttf $out/share/fonts/truetype/be-vietnam-pro/
            ''
          )
        ];
      };

      stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/${colorScheme}.yaml";

        cursor = {
          package = pkgs.bibata-cursors;
          name = "Bibata-Modern-Ice";
          size = 25;
        };

        fonts = {
          emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
          };
          monospace = {
            package = pkgs.nerd-fonts.geist-mono;
            name = "Geist Mono";
          };
          sansSerif = {
            package = pkgs.geist-font;
            name = "Geist";
          };
          serif = config.stylix.fonts.sansSerif;
          sizes = {
            applications = 12;
            desktop = 10;
            popups = 10;
            terminal = 10;
          };
        };

        polarity = "dark";

        icons = {
          enable = true;
          package = pkgs.kora-icon-theme;
          dark = "kora";
        };

        opacity.applications = 0.8;

        targets = {
          limine.image.enable = false;
        };
      };
    };
}

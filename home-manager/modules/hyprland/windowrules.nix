# windowrules.nix
{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.hyprland;
in {
  config = mkIf cfg.enable {
    xdg.configFile."hypr/configs/windowrules.conf".text = ''
      # Window rules
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

      # Picture-in-Picture rules
      windowrulev2 = float,initialTitle:^Picture-in-Picture$
      windowrulev2 = pin,initialTitle:^Picture-in-Picture$
      windowrulev2 = keepaspectratio,initialTitle:^Picture-in-Picture$
      windowrulev2 = size 30% 30%,initialTitle:^Picture-in-Picture$
      windowrulev2 = suppressevent fullscreen maximize,initialTitle:^Picture-in-Picture$

      # ZenBrowser rules
      windowrulev2 = float,initialClass:^zen$,initialTitle:^(?!Zen Browser$).*$
      windowrulev2 = size 60% 80%,initialClass:^zen$,initialTitle:^(?!Zen Browser$).*$
      windowrulev2 = suppressevent fullscreen maximize,initialClass:^zen$,initialTitle:^(?!Zen Browser$).*$
      windowrulev2 = tile,initialClass:^zen$,initialTitle:^Zen Browser$

      # GTK portal file browser
      windowrulev2 = float,initialClass:^xdg-desktop-portal-gtk$
      windowrulev2 = size 60% 80%,initialClass:^xdg-desktop-portal-gtk$

      # Telegram rules
      windowrulev2 = fullscreen,initialClass:^org.telegram.desktop$,title:^Media viewer$
      windowrulev2 = float,initialClass:^org.telegram.desktop$,title:^Media viewer$
      windowrulev2 = float,initialClass:^telegram-desktop$
      windowrulev2 = size 60% 80%,initialClass:^telegram-desktop$

      # Ripdrag
      windowrulev2 = pin,class:^it.catboy.ripdrag$

      # Foot terminal rules
      windowrulev2 = float,initialTitle:^foot-float$
      windowrulev2 = size 720 504,initialTitle:^foot-float$
      windowrulev2 = float,initialClass:^foot-popup$
      windowrulev2 = center 1,initialClass:^foot-popup$
      windowrulev2 = size 720 504,initialClass:^foot-popup$
      windowrulev2 = pin,initialClass:^foot-popup$
      windowrulev2 = stayfocused,initialClass:^foot-popup$

      # imv rules
      windowrulev2 = float,initialTitle:^imv-float$

      # Vesktop rules
      windowrulev2 = suppressevent fullscreen maximize,initialClass:^vesktop$
      windowrulev2 = float,initialTitle:^Open Files$
      windowrulev2 = size 60% 80%,initialTitle:^Open Files$

      # Global floating window rules
      windowrulev2 = bordersize 2,floating:1
      windowrulev2 = center 1,floating:1
    '';
  };
}

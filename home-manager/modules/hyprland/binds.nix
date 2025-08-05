{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.modules.hyprland;
  scriptsDir = "${config.xdg.configHome}/hypr/scripts";
in {
  config = mkIf cfg.enable {
    xdg.configFile."hypr/configs/binds.conf".text = ''
      $scripts = ${scriptsDir}
      $configs = ${config.xdg.configHome}/hypr/configs
      $themes = ${config.xdg.configHome}/hypr/themes

      $mainMod = Super
      $terminal = kitty
      $browser = "app.zen_browser.zen"
      $fileManager = thunar
      $menu = rofi -show drun -theme ~/.config/rofi/themes/nord.rasi
      $home = ${config.home.homeDirectory}

      # ---------------------------
      # System Actions
      # ---------------------------
      bind = $mainMod, C, killactive             # Close focused window
      bind = $mainMod SHIFT, M, exit             # Exit Hyprland
      bind = $mainMod, V, togglefloating         # Toggle floating window
      bind = $mainMod, L, exec, hyprlock         # Lock screen
      bind = $mainMod, Q, exec, $terminal
      bind = $mainMod, P, pseudo                 # Dwindle layout pseudo-tiling
      bind = $mainMod, J, togglesplit            # Toggle split orientation
      bind = $mainMod, M, exec, wlogout -b 5     # Power menu
      bind = $mainMod, Y, exec, $home/.scripts/rofi-beats
      bind = $mainMod, D, exec, anyrun
      bind = Alt, Return, fullscreen             # Toggle fullscreen
      bind = $mainMod SHIFT, R, exec, dunstctl history-pop
      bind = $mainMod, A, exec, pavucontrol
      bind = $mainMod SHIFT, V, exec, $home/.config/home-manager/files/scripts/clipboard/clipboard-menu

      # Application Keybinds
      bind = $mainMod, RETURN, exec, $terminal
      bind = $mainMod, F, exec, $browser         # Open browser
      bind = $mainMod, E, exec, $fileManager     # Open file manager
      bind = $mainMod, R, exec, $menu            # Open app menu

      # Move focus
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      # Switch workspaces
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10

      # Move active window to a workspace
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      # Move focused window to a workspace silently
      bind = $mainMod ALT, 1, movetoworkspacesilent, 1
      bind = $mainMod ALT, 2, movetoworkspacesilent, 2
      bind = $mainMod ALT, 3, movetoworkspacesilent, 3
      bind = $mainMod ALT, 4, movetoworkspacesilent, 4
      bind = $mainMod ALT, 5, movetoworkspacesilent, 5
      bind = $mainMod ALT, 6, movetoworkspacesilent, 6
      bind = $mainMod ALT, 7, movetoworkspacesilent, 7
      bind = $mainMod ALT, 8, movetoworkspacesilent, 8
      bind = $mainMod ALT, 9, movetoworkspacesilent, 9
      bind = $mainMod ALT, 0, movetoworkspacesilent, 10

      # Move active window within workspace
      bind = $mainMod SHIFT, left, movewindow, l
      bind = $mainMod SHIFT, right, movewindow, r
      bind = $mainMod SHIFT, up, movewindow, u
      bind = $mainMod SHIFT, down, movewindow, d

      # Resize active window
      bind = $mainMod ALT, left, resizeactive, -40 0
      bind = $mainMod ALT, right, resizeactive, 40 0
      bind = $mainMod ALT, up, resizeactive, 0 -40
      bind = $mainMod ALT, down, resizeactive, 0 40

      # Special workspace (scratchpad)
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      # Scroll through workspaces
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Screenshot
      bind = CTRL SHIFT, S, exec, $home/.config/home-manager/files/scripts/screenshots/screenshot-area
      bind = , Print, exec, $home/.config/home-manager/files/scripts/screenshots/screenshot-full
      bind = SHIFT, Print, exec, $home/.config/home-manager/files/scripts/screenshots/screenshot-window

      bind = , switch:on:Lid Switch, exec, systemctl suspend && hyprlock

      # ---------------------------
      # Mouse & Multimedia
      # ---------------------------
      # Mouse binds
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      # Volume/Brightness
      bindel = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
      bindel = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = , XF86MonBrightnessUp, exec, brightnessctl set 10%+
      bindel = , XF86MonBrightnessDown, exec, brightnessctl set 10%-

      # Media Controls
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioNext, exec, playerctl next
      bindl = , XF86AudioPrev, exec, playerctl previous
    '';
  };
}

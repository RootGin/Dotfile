{ config, lib, pkgs, ... }:

let
  cfg = config.modules.hyprland;
  assetsDir = "${config.xdg.configHome}/home-manager/assets";
  hyprlockConfig = ''
    source = ./themes/colors.conf

    general {
        immediate_render = true
        # no_fade_in = true
        # no_fade_out = true
        hide_cursor = false
        grace = 0
        # disable_loading_bar = true
    }

    background {
        monitor =
        #path = screenshot
        path = ${assetsDir}/system/hyprlock-wallpaper.jpg
        color = rgba(46,52,64, 1.0)  (nord0)
        blur_passes = 1
        contrast = 1
        brightness = 0.5
        vibrancy = 0.2
        vibrancy_darkness = 0.2
    }

    # DATE
    label {
        monitor =
        text = cmd[update:1000] echo "$(date +"%A, %B %d")"
        color = rgba(216, 222, 233, 0.75)  # nord4 with transparency
        font_size = 22
        font_family = JetBrains Mono
        position = 0, 300
        halign = center
        valign = center
    }

    # TIME
    label {
      monitor =
      text = cmd[update:1000] echo "$(date +"%-I:%M")"
      color = rgba(216, 222, 233, 0.75)  # nord4 with transparency
      font_size = 95
      font_family = JetBrains Mono Extrabold
      position = 0, 200
      halign = center
      valign = center
    }

    # Profile Picture
    image {
        monitor =
        path = ${assetsDir}/system/hyprlock-profile.png
        size = 150
        border_size = 2
        border_color = #D8DEE9  # nord4
        position = 0, 30 # or position = 0, 100
        halign = center
        valign = center
    }

    # USER
    label {
        monitor =
        text =   $USER
        color = rgba(216, 222, 233, 0.75)
        font_size = 24
        font_family = Victor Mono Bold Oblique
        position = 0, 270
        halign = center
        valign = bottom
    }

    # INPUT FIELD
    input-field {
        monitor =
        size = 250, 60
        outline_thickness = 2
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.35 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = rgba(46, 52, 64, 0)  # nord0 with transparency
        inner_color = rgba(46, 52, 64, 0.2)  # nord0 with transparency
        font_color = rgba(216, 222, 233, 1.0)  # nord4
        fade_on_empty = false
        rounding = -1
        check_color = rgb(191, 97, 106)  # nord11
        font_color = rgba(216, 222, 233, 1.0) # this is #D8DEE9 (nord4)
        placeholder_text = <i>Input Password...</i>
        hide_input = false
        position = 0, -200
        halign = center
        valign = center
    }

    # uptime
    label {
        monitor =
        text = cmd[update:60000] echo "<b> "$(uptime -p || ${config.xdg.configHome}/hypr/scripts/UpTime.sh)" </b>"
        color = rgba(216, 222, 233, 0.75)
        font_size = 8
        font_family = JetBrains Mono
        position = 0, 0
        halign = right
        valign = bottom
    }

    # CURRENT SONG
    label {
        monitor =
        text = cmd[update:1000] echo "<b> "$(${config.xdg.configHome}/hypr/scripts/whatsong.sh)" </b>"
        color = rgba(216, 222, 233, 1.0)  # nord4
        font_size = 18
        font_family = "Metropolis Light, Font Awesome 6 Free Solid"
        position = 0, 50
        halign = center
        valign = bottom
    }
  '';
in {
  config = lib.mkIf cfg.enable {
    xdg.configFile."hypr/hyprlock.conf".text = hyprlockConfig;
  };
}

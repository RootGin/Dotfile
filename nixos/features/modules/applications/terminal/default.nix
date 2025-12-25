{
  config,
  lib,
  ...
}:
let
  username = config.userOptions.username;
in
{
  options.programs.terminal = {
    enable = lib.mkEnableOption "Enable terminal module";
  };

  config = lib.mkIf config.programs.terminal.enable {
    home-manager.users.${username} = {
      stylix.targets.kitty.enable = false;
      programs.kitty = {
        enable = true;
        settings = {
          background_opacity = "0.5";
          cursor_shape = "block";
          cursor_blink_interval = 0; # Disable cursor blinking
        };
        # Additional kitty configuration can go here
      };
    };
  };
}

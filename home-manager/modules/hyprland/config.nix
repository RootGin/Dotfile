{ config, lib, pkgs, ... }:

let
  cfg = config.modules.hyprland;
in {
  config = lib.mkIf cfg.enable {
    systemd.user.services = {
      polkit-agent = {
        Unit.Description = "Polkit Authentication Agent";
        Service.ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Install.WantedBy = [ "graphical-session.target" ];
      };

      network-applet = {
        Unit.Description = "Network Manager Applet";
        Service.ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet";
        Install.WantedBy = [ "graphical-session.target" ];
      };
    };
  };
}

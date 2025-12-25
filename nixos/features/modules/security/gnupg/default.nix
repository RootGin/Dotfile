{
  config,
  lib,
  pkgs,
  ...
}:
let
  username = config.userOptions.username;
in
{
  options.securityModule.gpg = {
    enable = lib.mkEnableOption "Enable the gpg module";
  };

  config = lib.mkIf config.securityModule.gpg.enable {
    #programs.gnupg = {
    #  agent.enable = true;
    #  agent.enableSSHSupport = true;
    #};
    #
    #environment.systemPackages = with pkgs; [
    #  pinentry-curses
    #  pinentry-gnome3
    #];

    home-manager.users.${username} = _: {
        programs.gpg.enable = true;

        services.gpg-agent = {
          enable = true;
          enableSshSupport = true;
          pinentry.package = pkgs.pinentry-gnome3;
          
          defaultCacheTtlSsh = 14400;
          maxCacheTtlSsh = 14400;

          sshKeys = [
            "587D78D19A259FBDE134311DB11AE28644C4EFE5"
          ];
        };
      home.file = {
        #".gnupg/gpg-agent.conf".source = ./gpg-agent.conf;
      };
    };
  };
}

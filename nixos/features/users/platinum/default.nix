{
  config,
  pkgs,
  ...
}:
let
  username = config.userOptions.username;
in
{
  programs.bash.enable = true;
  users.users.${username} = {
    shell = pkgs.bash;
    isNormalUser = true;
    initialPassword = "shine";
    extraGroups = [
      "docker"
      "wheel"
      "openrazer"
    ];
  };
  users.defaultUserShell = pkgs.bash;
}

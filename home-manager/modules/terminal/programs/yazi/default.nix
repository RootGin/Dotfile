{ config, lib, pkgs, inputs, ... }:
let
  theme = config._module.args.theme;
in
{
  home.packages = [pkgs.exiftool];

#   imports = [
#     ./theme/filetype.nix
#     ./theme/icons.nix
#     ./theme/manager.nix
#     ./theme/status.nix
#   ];
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.default;
    enableBashIntegration = config.programs.bash.enable;
    enableZshIntegration = config.programs.zsh.enable;
    shellWrapperName = "y";
    settings = {
      manager = {
        layout = [1 4 3];
        sort_by = "alphabetical";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
        linemode = "none";
        show_hidden = false;
        show_symlink = true;
      };
      preview = {
        tab_size = 2;
        max_width = 600;
        max_height = 900;
        cache_dir = config.xdg.cacheHome;
      };
    };
    keymap.manager.prepend_keymap = [
      {
        on = ["<C-n>"];
        run = ''shell '${lib.getExe pkgs.ripdrag} "$@" -x 2>/dev/null &' --confirm'';
      }
    ];
    theme = {
      filetype = (import ./theme/filetype.nix { inherit theme; });
      icons    = import ./theme/icons.nix;
      manager  = import ./theme/manager.nix { inherit theme; };
      status   = import ./theme/status.nix { inherit theme; };
    };
  };
}

# features/modules/programs/comms/options.nix
{ lib, ... }:

{
  options.programs.comms = {
    enable = lib.mkEnableOption "Enables communication module";
  };
}

{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config.conf) extraLayout;
in mkIf extraLayout.enable {
  services.xserver.xkb = {
    layout = "ie,ee,ua,ru";
    variant = ",,phonetic,"
 };

  console.keyMap = "ie";
}

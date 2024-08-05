{ lib, config, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
  inherit (config.conf) keys;
in mkIf conf.apps.enable {
  home-manager.users.${conf.username} = {
    home.packages = [
    ];

    programs.sioyek = {
      enable = true;
      bindings = {
        "move_up" = keys.up;
        "move_down" = keys.down;
        "move_left" = keys.left;
        "move_right" = keys.right;
      };
    };
  };
}

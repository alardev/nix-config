{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf;
  inherit (config) conf;
  swayosd-style = pkgs.writeText "swayosd.css" 
    (import ./swayosd.css.nix { config = config; }).style;
in {
  config = mkIf conf.niri.enable {
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    services.upower = {
      enable = true;
    };

    services.logind = {
      powerKey = "suspend";
      powerKeyLongPress = "poweroff";
      lidSwitch = "suspend";
      lidSwitchDocked = "suspend";
      lidSwitchExternalPower = "suspend";
    };

    home-manager.users.${conf.username} = {
      home.packages = with pkgs; [
        swayidle
        cosmic-notifications
        cosmic-term
        cosmic-files
        cosmic-greeter
      ];

      services.swayosd = {
        enable = true;
        topMargin = 0.8;
        stylePath = swayosd-style; 
      };

      programs.niri = {
        settings = import ./niri.conf.nix { config = config; };
      };

      programs.anyrun= {
        enable = true;
        settings = import ./anyrun.conf.nix { lib = lib; config = config; };
      };

      programs.ironbar = {
        enable = true;
        settings = import ./ironbar.conf.nix { };
        style = (import ./ironbar.css.nix { config = config; }).style;
      };

      programs.swaylock = {
        enable = true;
        package = (pkgs.swaylock-effects.overrideAttrs (final: prev: {
          buildInputs = prev.buildInputs ++ [ pkgs.wayland-scanner ];
        }));
        settings = import ./swaylock.conf.nix { lib = lib; config = config; };
      };
    };
  };
}

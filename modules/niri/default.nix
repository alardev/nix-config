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

    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override ({
        flavor = "mocha";
        font = "Fira Code Nerd Font";
        background = "${./sddm.wallpaper.png}";
        loginBackground = true;
      }))
    ];

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

      services.mako = {
        enable = true;
        defaultTimeout = 5000;
        maxVisible = 3;
        font = "AlegreyaSans";
        backgroundColor = config.theme.base;
        borderColor = config.theme.muted;
        textColor = config.theme.text;
        borderSize = 1;
        borderRadius = 8;
        icons = false;
      };
    };
  };
}

{ config, pkgs, ... }: let
  inherit (config) conf;
in{
  home-manager.users.${conf.username}.home.packages = [ pkgs.networkmanagerapplet ];
  networking = {
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };
}

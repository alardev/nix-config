{ config, ... }: let
  inherit (config) conf;
in {
  imports = [
    ./apps
    ./containers
    ./fonts
    ./games
    ./home
    ./layout
    ./networking
    ./niri
    ./nix
    ./secureboot
    ./utils
    ./vm
  ];

  documentation.nixos.enable = false;

  time.timeZone = "Europe/Tallinn";
  i18n = {
    defaultLocale = "en_IE.UTF-8";
  };

  users.users.${conf.username}= {
    isNormalUser = true;
    description = conf.username;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  hardware.opentabletdriver = {
    enable = true;
  };

  system.stateVersion = conf.stateVersion;
}

{ lib, config, pkgs, ... }: let
  inherit (lib) mkIf mkMerge;
  holo-script = pkgs.writeShellApplication {
    name = "holo-script";
    runtimeInputs = [ pkgs.steam pkgs.gamescope ];
    text = ''
      gamescope -f -h 1504 -w 2256 -r 60 -F fsr -e -- steam
    '';
  };
  holo = pkgs.makeDesktopItem {
    name = "holo";
    desktopName = "Holo";
    exec = "${holo-script}/bin/holo-script";
  };
in mkIf config.withGames (mkMerge [
  (mkIf config.withImpermanence {
    environment.persistence."/persist".users.${config.username}= {
      directories = [
        "Games"
        ".steam"
        ".local/share/PrismLauncher"
      ];
    };
  }) {
    programs.steam.enable = true;
    programs.gamescope.enable = true;
    programs.gamemode.enable = true;

    home-manager.users.${config.username} = {
      home.packages = [
        pkgs.prismlauncher
        holo
      ];
    };
  }
])

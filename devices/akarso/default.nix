{ pkgs, ... }: {
  imports = [
    ./hardware-config.nix
    ./options.nix
  ];

  networking.hostName = "akarso";

  users.users.twoneis.extraGroups = [ "surface-control" ];

  boot.loader = {
    systemd-boot = {
      enable = true;
    };
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  services.thermald.enable = true;

  microsoft-surface = {
    ipts.enable = true;
    surface-control.enable = true;
  };

  system.stateVersion = "23.05";

}

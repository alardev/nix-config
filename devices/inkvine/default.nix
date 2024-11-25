{ lib, config, pkgs, ... }: let
  inherit (lib) mkDefault;
  inherit (config.device) disks;
in {
  imports = [
    ./disks.nix
    ./options.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  networking.hostName = "blackmesa";

  boot = {
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "thunderbolt" "usb_storage" "sd_mod" ];
      luks.devices.root.device = "/dev/disk/by-uuid/${disks.crypt}";
      kernelModules = [ "amdgpu" ];
    };
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot = {
        enable = mkDefault true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/${disks.boot}";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/disk/by-uuid/${disks.root}";
      fsType = "ext4";
    };
  };

  services = {
    fwupd.enable = true; 
    power-profiles-daemon.enable = true;
  };

  hardware = {
    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    cpu.amd.updateMicrocode = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}

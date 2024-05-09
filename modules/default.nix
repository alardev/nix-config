# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, pkgs, ... }: {
  imports = [
    ./audio
    ./bluetooth
    ./containers
    ./distrobox
    ./games
    ./gnome
    ./home
    ./niri
    ./nvidia
    ./virt
  ];

  nixpkgs = {
    overlays = [
      inputs.nur.overlay
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  documentation.nixos.enable = false;

  networking = {
    networkmanager.enable = true;
    extraHosts = 
    ''
      10.10.11.245 surveillance.htb
    '';
  };

  time.timeZone = "Europe/Amsterdam";
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  fonts = {
    packages = with pkgs; [
      alegreya
      alegreya-sans
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Alegreya" ];
        sansSerif = [ "Alegreya Sans" ];
        monospace = [ "Fira Code Nerd Font" ];
      };
    };
  };

  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    displayManager.gdm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.printing.enable = false;

  security.rtkit.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  users.users.twoneis = {
    isNormalUser = true;
    description = "twoneis";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  security.pam.services.swaylock = {};
}
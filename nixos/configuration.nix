# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  ...
}:

let
  unstable-pkgs = import <nixpkgs-unstable> { config.allowUnfree = true; };
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 5;
    };

    kernelPackages = unstable-pkgs.linuxPackages_latest;
  };

  networking.hostName = "BlackMesa"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Tallinn";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_IE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable gnome browser connector for extensions.
  services.gnome.gnome-browser-connector.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us,ua:phonetic,ee,ru:phonetic";
      variant = "";
    };
  };

  services.gnome.core-utilities.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Graphics and 32bit support for steam etc.
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;

  # Flatpak
  # services.flatpak.enable = true;
  # systemd.services.flatpak-repo = {
  #   wantedBy = [ "multi-user.target" ];
  #   path = [ pkgs.flatpak ];
  #   script = ''
  #     flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  #   '';
  # };

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alar = {
    isNormalUser = true;
    description = "alar";
    extraGroups = [
      "networkmanager"
      "wheel"
      "podman"
      "docker"
      "dialout"
    ];
    #packages = with pkgs; [
    #  firefox
    #  thunderbird
    #];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with unstable-pkgs; [
    gnome-software
    telegram-desktop
    gnome-system-monitor
    nautilus
    nixfmt-rfc-style
    lm_sensors
    gnome-weather
    dconf2nix

    bottles

    chromium
    discord
    qdigidoc
    chrome-token-signing

    gnome-extension-manager
    toolbox
    podman-desktop
    podman-tui
    podman-compose
    crun
    talosctl
    kubectl
    helm
  ];

  ########################
  # Gaming related stuff #
  ########################

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
    protontricks.enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  hardware.steam-hardware.enable = true;

  # Firefox
  programs.firefox = {
    package = unstable-pkgs.firefox-devedition;
    enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  ##############
  # GDM Config #
  ##############

  programs.dconf.profiles.gdm.databases = [
    {
      settings = {
        "org/gnome/settings-daemon/plugins/power" = {
          power-button-action = "suspend";
        };
        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
        };
      };
    }
  ];

  ####################################################
  # Home-manager config for gnome, neovim, alacritty #
  ####################################################

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.alar =
    { config, unstable-pkgs, ... }:
    {
      imports = [
        ../home-manager/home.nix
      ];
    };

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  ##################
  # Virtualisation #
  ##################

  # Apptainer
  programs.singularity = {
    enable = true;
    package = unstable-pkgs.apptainer;
  };

  # Podman w/ Docker compat
  virtualisation = {
    #containers.enable = true;

    #containers.containersConf.settings = {
    #  engine.runtimes = {
    #    runc = [
    #      "${unstable-pkgs.runc}"
    #    ];
    #    crun = [
    #      "${unstable-pkgs.crun}"
    #    ];
    #  };
    #};
    #oci-containers.backend = "podman";

    podman = {
      enable = true;
      autoPrune.enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
      #networkSocket.enable = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

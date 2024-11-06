{ config, pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./alacritty.nix
    ./dconf.nix
  ];

  nixpkgs.config.allowUnfree = true;
  home.enableNixpkgsReleaseCheck = false;

  home.packages = with pkgs; [
    neofetch
    onefetch
    zip
    unzip
    jq
    sysstat
    ethtool
    pciutils
    usbutils
    eza
    rustup
    neovide
    gcc
    curl
    wget
    git
    gh
  ];

  programs.git = {
    enable = true;
    userName = "alardev";
    userEmail = "alar.okas@protonmail.com";
  };

  programs.gh = {
    enable = true;
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
      format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
      shell = {
        disabled = false;
        format = "$indicator";
        fish_indicator = "[FISH](bright-white)";
        bash_indicator = "[BASH](bright-white) ";
        zsh_indicator = "[ZSH](bright-white) ";
      };
      directory.fish_style_pwd_dir_length = 1; # turn on fish directory truncation
      directory.truncation_length = 2; # number of directories not to truncate
      hostname.style = "bold green"; # don't like the default
      memory_usage.disabled = true; # because it includes cached memory it's reported as full a lot
      shlvl.disabled = false;
      username.style_user = "bold purple"; # don't like the default
    };
  };

  programs.fish = {
    enable = true;
    shellInit = ''clear; neofetch'';
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';

    shellAliases = {
      c = "clear";
      #serve = "python -m http.server";
      ls = "exa -l --icons=always";
      #ns = "nix-shell";
      rm = "rm -rfv";
      mv = "mv -v";
      rgen = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 1d";
      update = "sudo nixos-rebuild switch";
    };
  };

  #home.file.".config/wezterm/wezterm.lua".source = ./config/wezterm/wezterm.lua;
  #home.file.".config/rofi/config.rasi".source = ./config/rofi/config.rasi;
  #home.file.".config/waybar/config".source = ./config/waybar/config;
  #home.file.".config/waybar/style.css".source = ./config/waybar/style.css;	

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}

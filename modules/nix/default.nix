{ inputs, ... }: {
  nix = {
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 3d";
    };
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  nixpkgs = {
    overlays = [
      inputs.nur.overlay
      inputs.niri.overlays.niri
    ];
    config = {
      allowUnfree = true;
    };
  };
}

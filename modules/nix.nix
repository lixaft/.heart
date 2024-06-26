{ ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true;
      warn-dirty = false;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "python" ];
  };
}

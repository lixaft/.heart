{
  nixpkgs,
  nixos-wsl,
  home-manager,
  ...
}@inputs:
{
  system,
  host,
  user,
  home ? false,
  wsl ? false,
  stateVersion,
}@systemInputs:
let
  specialArgs = rec {
    inputs = inputs;
    system = systemInputs;
    theme = import ../theme;
    colors = theme.colors;
  };
  overlays = [ ];

  wslModule = nixos-wsl.nixosModules.wsl;
  homeModule = home-manager.nixosModules.home-manager;

  homeConfig = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.${user}.imports = [ ../home ];
      extraSpecialArgs = specialArgs;
      backupFileExtension = "bak";
    };
  };
in
nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    { config._module.args = specialArgs; }
    { nixpkgs.overlays = overlays; }

    (if wsl then wslModule else { })

    ../hosts/${host}.nix
    ../users/${user}.nix

    (if home then homeModule else { })
    (if home then homeConfig else { })
  ];
}

{ ... }:
{
  imports = [
    ../modules/nvidia.nix
    ./hardware/kiwi.nix
    ./shared/linux.nix
  ];

  system.stateVersion = system.stateVersion;
}

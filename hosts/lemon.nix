{ ... }:
{
  imports = [
    ../modules/bluetooth.nix
    ../modules/nvidia.nix
    ./hardware/lemon.nix
    ./shared/linux.nix
  ];
}

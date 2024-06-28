{ config, system, ... }:
{
  imports = [
    ../modules/desktop.nix
    ../modules/workstation.nix
    ./hardware/lemon.nix
  ];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  system.stateVersion = system.stateVersion;
}

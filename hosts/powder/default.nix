{ system, ... }:
{
  imports = [ ../modules/workstation.nix ];

  wsl = {
    wslConf.automount.root = "/mnt";
  };

  fileSystems = {
    "/a" = {
      device = "A:";
      fsType = "drvfs";
    };
    "/c" = {
      device = "C:";
      fsType = "drvfs";
    };
    "/n" = {
      device = "N:";
      fsType = "drvfs";
    };
    "/o" = {
      device = "O:";
      fsType = "drvfs";
    };
    "/y" = {
      device = "Y:";
      fsType = "drvfs";
    };
  };

  system.stateVersion = system.stateVersion;
}

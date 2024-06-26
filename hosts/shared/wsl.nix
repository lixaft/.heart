{ system, ... }:
{
  imports = [
    ../../modules/nix.nix
    ../../modules/system.nix
    ../../modules/virtualisation.nix
  ];

  wsl = {
    enable = true;
    startMenuLaunchers = true;
    defaultUser = system.user;
    wslConf.network.hostname = system.host;
  };
}

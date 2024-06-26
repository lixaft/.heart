{ system, ... }:
{
  networking = {
    hostName = system.host;
    networkmanager.enable = true;
    firewall.enable = true;
  };

  users.users.${system.user}.extraGroups = [ "networkmanager" ];
}

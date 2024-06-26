{ system, pkgs, ... }:
{
  virtualisation = {
    containers.enable = true;
    libvirtd.enable = true;

    podman = {
      enable = true;
      # dockerSocket.enable = true; # TODO: maybe for the `act` issue?
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  programs = {
    virt-manager.enable = true;
  };

  environment.systemPackages = with pkgs; [ virtiofsd ];

  users.users.${system.user}.extraGroups = [
    "libvirtd"
    "podman" # TODO: check if it actually fix `act` without sudo.
  ];
}

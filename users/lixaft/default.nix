{ system, pkgs, ... }:
{
  programs.fish.enable = true;

  users.users.${system.user} = {
    isNormalUser = true;
    description = "${system.user}";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}

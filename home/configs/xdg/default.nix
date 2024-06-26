{ config, ... }:
{
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      pictures = "${config.home.homeDirectory}/pictures";
      videos = "${config.home.homeDirectory}/videos";
      music = "${config.home.homeDirectory}/musics";
      publicShare = "${config.home.homeDirectory}";
      templates = "${config.home.homeDirectory}";
    };
  };
}

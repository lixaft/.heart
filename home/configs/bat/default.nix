{ pkgs, ... }:
{
  home.shellAliases = {
    cat = "${pkgs.bat}/bin/bat";
    diff = "${pkgs.bat-extras.batdiff}/bin/batdiff";
    man = "${pkgs.bat-extras.batman}/bin/batman";
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      batman
      batpipe
      batwatch
      prettybat
    ];

    config = {
      theme = "tokyonight";
    };

    themes = {
      tokyonight = {
        src = pkgs.fetchFromGitHub {
          owner = "folke";
          repo = "tokyonight.nvim";
          rev = "main";
          sha256 = "sha256-ItCmSUMMTe8iQeneIJLuWedVXsNgm+FXNtdrrdJ/1oE=";
        };
        file = "extras/sublime/tokyonight_night.tmTheme";
      };
    };
  };
}

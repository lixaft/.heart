{
  wallpaper = ./wall.png;

  colors = rec {
    # Colors.
    black = "#15161e";
    blue = "#7aa2f7";
    cyan = "#7dcfff";
    gray = "#a9b1d6";
    green = "#9ece6a";
    magenta = "#bb9af7";
    orange = "#ff9e64";
    purple = "#9d7cd8";
    red = "#f7768e";
    teal = "#1abc9c";
    white = "";
    yellow = "#e0af68";

    # Extras Colors.
    blue0 = "#3d59a1";
    blue1 = "#2ac3de";
    blue2 = "#0db9d7";
    blue5 = "#89ddff";
    blue6 = "#b4f9f8";
    blue7 = "#394b70";
    dark3 = "#545c7e";
    dark5 = "#737aa2";
    green1 = "#73daca";
    green2 = "#41a6b5";
    magenta2 = "#ff007c";
    red1 = "#db4b4b";

    # Others.
    fg = "#c0caf5";
    bg = "#030305";
    bg_highlight = "#292e42";

    # Types.
    accent = blue;
    comment = "#565f89";

    # Bar.
    bar = {
      fg = gray;
      bg_dark = "#08080c";
      bg_light = black;
    };

    git = {
      add = "#449dab";
      change = "#6183bb";
      delete = "#914c54";
    };

    # diff = {
    #     add = util.darken(colors.green2, 0.15),
    #     delete = util.darken(colors.red1, 0.15),
    #     change = util.darken(colors.blue7, 0.15),
    #     text = colors.blue7,
    #   }
    diff = {
      add = green2;
      delete = red1;
      change = blue7;
      text = blue7;
    };

    # Base16.
    base00 = "";
    base01 = red;
    base02 = green;
    base03 = yellow;
    base04 = blue;
    base05 = magenta;
    base06 = cyan;
    base07 = gray;
    base08 = "";
    base09 = red;
    base10 = green;
    base11 = yellow;
    base12 = blue;
    base13 = magenta;
    base14 = cyan;
    base15 = gray;

    # accent = blue;
    #
    # black = bg;
    #
    # bg_dark = "#1f2335";
    # bg = "#08080C";
    # bg_highlight = "#111118";
    # terminal_black = "#414868";
    # fg = "#c0caf5";
    # fg_dark = "#a9b1d6";
    # fg_gutter = "#3b4261";
    # dark3 = "#545c7e";
    # comment = "#565f89";
    # dark5 = "#737aa2";
    # blue0 = "#3d59a1";
    # blue = "#7aa2f7";
    # cyan = "#7dcfff";
    # blue1 = "#2ac3de";
    # blue2 = "#0db9d7";
    # blue5 = "#89ddff";
    # blue6 = "#b4f9f8";
    # blue7 = "#394b70";
    # magenta = "#bb9af7";
    # magenta2 = "#ff007c";
    # purple = "#9d7cd8";
    # orange = "#ff9e64";
    # yellow = "#e0af68";
    # green = "#9ece6a";
    # green1 = "#73daca";
    # green2 = "#41a6b5";
    # teal = "#1abc9c";
    # red = "#f7768e";
    # red1 = "#db4b4b";
    # git = {
    #   add = "#449dab";
    #   change = "#6183bb";
    #   delete = "#914c54";
    # };
    # gitSigns = {
    #   add = "#266d6a";
    #   change = "#536c9e";
    #   delete = "#b2555b";
    # };
  };
}

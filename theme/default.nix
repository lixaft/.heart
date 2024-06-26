rec {
  wallpaper = ./wall.png;

  # Slightly modified version of the "Tokyo Night" theme from @folke.
  # https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/colors.lua
  accentColor = colors.blue;
  colors = {
    bg_dark = "#1f2335";
    bg = "#08080C";
    bg_highlight = "#111118";
    terminal_black = "#414868";
    fg = "#c0caf5";
    fg_dark = "#a9b1d6";
    fg_gutter = "#3b4261";
    dark3 = "#545c7e";
    comment = "#565f89";
    dark5 = "#737aa2";
    blue0 = "#3d59a1";
    blue = "#7aa2f7";
    cyan = "#7dcfff";
    blue1 = "#2ac3de";
    blue2 = "#0db9d7";
    blue5 = "#89ddff";
    blue6 = "#b4f9f8";
    blue7 = "#394b70";
    magenta = "#bb9af7";
    magenta2 = "#ff007c";
    purple = "#9d7cd8";
    orange = "#ff9e64";
    yellow = "#e0af68";
    green = "#9ece6a";
    green1 = "#73daca";
    green2 = "#41a6b5";
    teal = "#1abc9c";
    red = "#f7768e";
    red1 = "#db4b4b";
    git = {
      add = "#449dab";
      change = "#6183bb";
      delete = "#914c54";
    };
    gitSigns = {
      add = "#266d6a";
      change = "#536c9e";
      delete = "#b2555b";
    };
  };
}

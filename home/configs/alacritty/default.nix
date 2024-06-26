{ colors, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.9;

      font = {
        normal.family = "DejaVuSansM Nerd Font";
        size = 17;
      };

      shell = {
        program = "fish";
        args = [
          "--interactive" # Required for tmux colors.
          "--command"
          "tmux attach || tmux-sessionizer ~"
        ];
      };

      colors = {
        primary = {
          background = "#030305";
          foreground = colors.fg;
        };
        normal = {
          black = "#15161e";
          inherit (colors)
            red
            green
            yellow
            blue
            magenta
            cyan
            ;
          white = colors.fg_dark;
        };
        bright = {
          black = colors.terminal_black;
          inherit (colors)
            red
            green
            yellow
            blue
            magenta
            cyan
            ;
          white = colors.fg;
        };
        indexed_colors = [
          {
            index = 16;
            color = colors.orange;
          }
          {
            index = 17;
            color = colors.red1;
          }
        ];
      };
    };
  };
}

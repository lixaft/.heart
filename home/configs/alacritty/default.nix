{ theme, ... }:
let
  inherit (theme) colors;
in
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
          background = colors.bg;
          foreground = colors.fg;
        };
        normal = {
          inherit (colors)
            black
            blue
            cyan
            green
            magenta
            red
            yellow
            ;
          white = colors.fg;
        };
        bright = {
          inherit (colors)
            black
            blue
            cyan
            green
            magenta
            red
            yellow
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
            color = colors.red;
          }
        ];
      };
    };
  };
}

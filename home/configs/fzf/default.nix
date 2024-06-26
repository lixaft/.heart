{ colors, ... }:
{
  programs.fzf = {
    enable = true;

    colors = {
      "bg+" = "-1";
      "bg" = "-1";
      "border" = "${colors.comment}";
      "fg+" = "${colors.fg}";
      "fg" = "${colors.fg}";
      "header" = "${colors.comment}";
      "hl+" = "${colors.blue}";
      "hl" = "${colors.blue}";
      "info" = "${colors.comment}";
      "marker" = "${colors.green}";
      "pointer" = "${colors.purple}";
      "prompt" = "${colors.comment}";
      "spinner" = "${colors.comment}";
    };
  };
}

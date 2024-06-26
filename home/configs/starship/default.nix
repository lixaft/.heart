{ ... }:
{
  programs.starship = {
    enable = true;
    enableTransience = true;

    settings = {
      add_newline = true;
      directory = {
        style = "bold blue";
      };
      shell = {
        disabled = false;
        bash_indicator = "bsh ";
        fish_indicator = "";
        format = "[$indicator]($style)";
      };
      nix_shell = {
        heuristic = true;
      };
      custom.lf = {
        command = ''echo "$LF_LEVEL"'';
        when = ''test -n "$LF_LEVEL"'';
        format = ''on [ $output]($style) '';
      };
    };
  };
}

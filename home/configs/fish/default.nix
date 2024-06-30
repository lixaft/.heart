{ theme, pkgs, ... }:
let
  inherit (theme) colors;
in
{
  programs.starship.enableFishIntegration = false;

  programs.fish = {
    enable = true;

    shellAliases = {
      refresh = "source $HOME/.config/fish/config.fish";
    };

    shellAbbrs = {
      "-" = {
        position = "command";
        expansion = "cd -";
      };
      "!!" = {
        position = "anywhere";
        function = "__last_command";
      };
    };

    functions = {
      __editor_paginate = # fish
        ''fish_commandline_append " &| $EDITOR -"'';
      __last_command = # fish
        ''echo $history[1]'';
    };

    interactiveShellInit = # fish
      ''
        set fish_greeting ""

        # Nix override the default Ctrl+r with a `fzf` one :s
        bind --erase \cr

        # Bindings.
        bind \ev "__editor_paginate";
        bind \cg "tmux-sessionizer ~/todo.md; commandline -f execute"
        bind \cg "tmux-sessionizer ~/todo.md; commandline -f execute"
        bind \ch "tmux-sessionizer ~; commandline -f execute"
        bind \cs "tmux-sessionizer; commandline -f execute"
        bind \ct "tmux-sessionizer /tmp; commandline -f execute"

        # Syntax highlighting colors.
        set --global fish_color_normal "${colors.fg}"
        set --global fish_color_command "${colors.cyan}"
        set --global fish_color_keyword "${colors.magenta}"
        set --global fish_color_quote "${colors.yellow}"
        set --global fish_color_redirection "${colors.fg}"
        set --global fish_color_end "${colors.orange}"
        set --global fish_color_error "${colors.red}"
        set --global fish_color_param "${colors.purple}"
        set --global fish_color_comment "${colors.comment}"
        set --global fish_color_selection --background="${colors.bg_highlight}"
        set --global fish_color_search_match --background="${colors.bg_highlight}"
        set --global fish_color_operator "${colors.green}"
        set --global fish_color_escape "${colors.magenta}"
        set --global fish_color_autosuggestion "${colors.comment}"

        # Completion pager colors.
        set --global fish_pager_color_progress "${colors.comment}"
        set --global fish_pager_color_prefix "${colors.cyan}"
        set --global fish_pager_color_completion "${colors.fg}"
        set --global fish_pager_color_description "${colors.comment}"
        set --global fish_pager_color_selected_background --background="${colors.bg_highlight}"
      '';

    shellInitLast = # fish
      ''
        # In tmux, make `cd` go to the session dir instead of `$HOME`.
        # This cannot be defined with the `functions' option from home manager,
        # as it must be done after Zoxide initialization.
        function cd
          if set -q "TMUX"; and test -z "$argv"
              set argv (tmux display-message -p "#{session_path}")
          end
          __zoxide_z $argv
        end

        # Allow starship to run properly inside distrobox.
        ${pkgs.starship}/bin/starship init fish | source
        enable_transience
      '';
  };
}

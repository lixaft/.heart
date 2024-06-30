{ pkgs, theme, ... }:
let
  inherit (theme) colors;
  tokyo-night = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tokyo-night";
    version = "unstable-2023-01-06";
    src = pkgs.fetchFromGitHub {
      owner = "janoamaral";
      repo = "tokyo-night-tmux";
      rev = "master";
      sha256 = "sha256-3rMYYzzSS2jaAMLjcQoKreE0oo4VWF9dZgDtABCUOtY=";
    };
    postInstall = # sh
      ''
        grep -lr "#1A1B26" $target | xargs sed -i -e "s/#1A1B26/${colors.bg}/"
        grep -lr "#2A2F41" $target | xargs sed -i -e "s/#2A2F41/${colors.bg_highlight}/"
      '';
  };
in
{
  programs.tmux = {
    enable = true;

    prefix = "C-a";
    mouse = true;
    resizeAmount = 10;
    keyMode = "vi";
    baseIndex = 1;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    historyLimit = 50000;

    plugins = with pkgs.tmuxPlugins; [ tokyo-night ];

    extraConfig = # tmux
      ''
        set -g default-terminal "xterm-256color"
        set -a terminal-features 'xterm-256color:RGB'

        # Enable mouse mode.
        set -g mouse on

        # Renumber windows when a window is closed.
        set -g renumber-windows on

        # Configure theme.
        set -g @tokyo-night-tmux_show_wbg 0
        set -g @tokyo-night-tmux_show_git 0
        set -g @tokyo-night-tmux_window_id_style hsquare
        run-shell ${tokyo-night}/share/tmux-plugins/tokyo-night/tokyo-night.tmux

        # Better copy-mode bindings.
        bind v copy-mode
        bind -T copy-mode-vi v "send-keys -X begin-selection"
        bind -T copy-mode-vi y "send-keys -X copy-selection"

        # Allow switching to previous with `-` like the `cd` command.
        bind - switch-client -l

        # Sane split commands.
        bind | split-window -h -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
        bind '"' split-window -v -c "#{pane_current_path}"

        # Select window.
        bind -n M-1 select-window -t 1
        bind -n M-2 select-window -t 2
        bind -n M-3 select-window -t 3
        bind -n M-4 select-window -t 4
        bind -n M-5 select-window -t 5
        bind -n M-6 select-window -t 6
        bind -n M-7 select-window -t 7
        bind -n M-8 select-window -t 8
        bind -n M-9 select-window -t 9

        # Fast pane switch (vim <3).
        bind -n M-h select-pane -L
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U
        bind -n M-l select-pane -R

        # Fast pane resize.
        bind -r H resize-pane -L 10
        bind -r J resize-pane -D 10
        bind -r K resize-pane -U 10
        bind -r L resize-pane -R 10

        # Easy sync mode.
        bind Enter setw synchronize-panes

        # Search projects.
        bind C-s run-shell "tmux new-window tmux-sessionizer"
        bind t run-shell "tmux-sessionizer /tmp"
        bind h run-shell "tmux-sessionizer ~"
        bind g run-shell "tmux-sessionizer ~/todo.md"
      '';
  };

  home.shellAliases =
    let
      env = "env TERM=xterm-256color";
    in
    {
      tmux = "${env} tmux";
      tmux-sessionizer = "${env} tmux-sessionizer";
    };
}

{
  theme,
  system,
  config,
  pkgs,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;

  root_dir = "${config.home.homeDirectory}/nixstation";
  scripts_dir = "${root_dir}/home/scripts";
in
{
  home = rec {
    username = system.user;
    homeDirectory = "/home/${system.user}";
    sessionPath = [ "${homeDirectory}/.local/bin" ];

    file = {
      ".local/bin/pydep".source = mkOutOfStoreSymlink scripts_dir + "/pydep";
      ".local/bin/tmux-sessionizer".source = mkOutOfStoreSymlink scripts_dir + "/tmux-sessionizer";
      ".local/bin/repdir".source = mkOutOfStoreSymlink scripts_dir + "/repdir";
      ".background-image".source = theme.wallpaper;
    };

    shellAliases = rec {
      os-update = "nix flake update ${root_dir}";
      os-test = "sudo nixos-rebuild test --flake ${root_dir}";
      os-rebuild = "sudo nixos-rebuild switch --flake ${root_dir}";
      os-upgrade = "${os-update} && ${os-rebuild}";

      db = "distrobox";
      dev = "distrobox enter dev";

      df = "df -H";
      du = "du -H";

      fd = "${pkgs.fd}/bin/fd --hidden";
      grep = "${pkgs.ripgrep}/bin/rg";

      docker = "podman";
      docker-compose = "podman-compose";
    };

    packages = with pkgs; [
      # Cli.
      act
      bc
      btop
      cloc
      cmake
      curl
      distrobox
      fd
      ffmpeg
      gh
      gnumake
      graphviz
      jq
      just
      killall
      less
      parallel
      podman-tui
      rename
      ripgrep
      tlrc
      tree
      xdg-utils

      # Development.
      black
      cargo
      gcc
      go
      luajit
      mypy
      nixfmt-rfc-style
      nodePackages.prettier
      nodejs
      python3
      ruff
      selene
      stylua
      twine
      typos
      uv
      zig

      # Desktop.
      playerctl

      # X Desktop.
      feh
      xclip

      # Wayland Desktop.
      swaybg

      # Applications.
      alacritty
      bazecor
      blender
      brave
      discord
      filebot
      flameshot
      geeqie
      gnome.eog
      gnome.nautilus
      gnome.sushi
      google-chrome
      gpick
      iaito
      pavucontrol
      peek
      protonvpn-gui
      qbittorrent
      spotify

      # Fonts.
      nerdfonts
    ];
  };

  programs = {
    bash.enable = true;
    home-manager.enable = true;
    zoxide.enable = true;
    thefuck.enable = true;
  };

  services = {
    picom.enable = true;
    unclutter.enable = true;
  };

  fonts.fontconfig.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };

  imports = [
    ./configs/alacritty
    ./configs/bat
    ./configs/eza
    ./configs/fish
    ./configs/fzf
    ./configs/git
    ./configs/i3
    ./configs/lf
    ./configs/nixpkgs
    ./configs/nvim
    ./configs/starship
    ./configs/theme
    ./configs/tmux
    ./configs/xdg
  ];

  systemd.user.startServices = "sd-switch";

  home.stateVersion = system.stateVersion;
}

{
  config,
  colors,
  pkgs,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  nvim_dir = "${config.home.homeDirectory}/nixstation/home/configs/nvim";
in
{
  xdg.configFile = {
    "nvim/after".source = mkOutOfStoreSymlink nvim_dir + "/after";
    "nvim/lua/lixaft".source = mkOutOfStoreSymlink nvim_dir + "/lua/lixaft";
    "nvim/plugin".source = mkOutOfStoreSymlink nvim_dir + "/plugin";
    "nvim/init.lua".source = mkOutOfStoreSymlink nvim_dir + "/init.lua";
    "nvim/lua/nix.lua".text = import ./lua/nix.nix colors;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      fswatch
      tree-sitter

      # LSP.
      basedpyright
      bash-language-server
      cmake-language-server
      gopls
      lua-language-server
      nodePackages.typescript-language-server
      pyright
      ruff-lsp
      rust-analyzer
      typos-lsp
      zls

      # Formatter & Linters.
      mypy
      nodePackages.prettier
      ruff
      selene
      shfmt
      stylua
    ];

    # Aliases.
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Providers.
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    plugins = with pkgs.vimPlugins; [
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      gitsigns-nvim
      harpoon2
      indent-o-matic
      lspkind-nvim
      lualine-nvim
      luasnip
      markdown-preview-nvim
      neodev-nvim
      none-ls-nvim
      nvim-cmp
      nvim-colorizer-lua
      nvim-lspconfig
      nvim-treesitter-context
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
      nvim-ufo
      nvim-web-devicons
      oil-nvim
      telescope-nvim
      tokyonight-nvim
      treesj
      undotree
      vim-better-whitespace
      vim-fugitive
      vim-illuminate
      virt-column-nvim
      zen-mode-nvim
    ];
  };
}

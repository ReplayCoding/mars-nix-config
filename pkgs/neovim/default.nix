{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      pkgs.myCopilotVim
      pkgs.myCokelinePlugin

      cmp_luasnip
      cmp-path
      cmp-buffer
      cmp-nvim-lsp
      catppuccin-nvim
      comment-nvim
      FTerm-nvim
      lightspeed-nvim
      lspkind-nvim
      lualine-nvim
      luasnip
      null-ls-nvim
      nvim-autopairs
      nvim-cmp
      nvim-lspconfig
      (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
      nvim-tree-lua
      presence-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      trouble-nvim
      which-key-nvim
      vim-cool
      vim-smoothie
    ];

    extraConfig = ''
      lua << EOF
      ${builtins.readFile ./config.lua}
      EOF
    '';
  };
}
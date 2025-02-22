{
  config,
  lib,
  ...
}:
{
  imports = [
    ./keys.nix
    ./sets.nix
    ./highlight.nix
    ./autocmd.nix

    ./plug/colorscheme/biscuit.nix
    ./plug/colorscheme/colorscheme.nix

    ./plug/completion/cmp.nix
    ./plug/completion/lspkind.nix

    ./plug/git/gitlinker.nix
    ./plug/git/gitsigns.nix
    ./plug/git/lazygit.nix
    ./plug/git/worktree.nix

    ./plug/lsp/conform.nix
    ./plug/lsp/fidget.nix
    ./plug/lsp/lsp.nix
    ./plug/lsp/lspsaga.nix
    ./plug/lsp/trouble.nix

    ./plug/snippets/luasnip.nix

    ./plug/statusline/lualine.nix

    #./plug/treesitter/treesitter-context.nix
    ./plug/treesitter/treesitter-textobjects.nix
    ./plug/treesitter/treesitter.nix

    ./plug/ui/btw.nix
    ./plug/ui/bufferline.nix
    ./plug/ui/noice.nix
    ./plug/ui/nvim-notify.nix
    ./plug/ui/telescope.nix

    ./plug/utils/comment.nix
    ./plug/utils/flash.nix
    ./plug/utils/grapple.nix
    ./plug/utils/illuminate.nix
    ./plug/utils/oil.nix
    ./plug/utils/undotree.nix
    ./plug/utils/ufo.nix
    ./plug/utils/whichkey.nix
    ./plug/utils/fzf.nix
    ./plug/utils/indent.nix
    ./plug/utils/toggleterm.nix
    ./plug/utils/colorizer.nix
    ./plug/utils/nvim-autotag.nix
    ./plug/utils/markdown-prev.nix
    ./plug/utils/lz-n.nix
    ./plug/utils/mini-nvim/default.nix
  ];
  options = {
    theme = lib.mkOption {
      default = "kanagawa-waves";
      type = lib.types.enum [
        "paradise"
        "decay"
        "mountain"
        "tokyonight"
        "everforest"
        "everblush"
        "jellybeans"
        "aquarium"
        "gruvbox"
        "kanagawa-waves"
      ];
    };
  };
  config = {
    # The base16 theme to use, if you want to use another theme, change it in colorscheme.nix
    theme = "kanagawa-waves";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}

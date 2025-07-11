{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    ./keys.nix
    ./sets.nix
    ./autocmd.nix

    ./plug/colorscheme/biscuit.nix
    ./plug/colorscheme/colorscheme.nix

    ./plug/completion/cmp.nix
    ./plug/completion/lspkind.nix
    ./plug/completion/copilot-cmp.nix

    ./plug/git/gitlinker.nix
    ./plug/git/gitsigns.nix
    # ./plug/git/lazygit.nix
    ./plug/git/fuzitive.nix
    ./plug/git/worktree.nix

    ./plug/lsp/conform.nix
    ./plug/lsp/fidget.nix
    ./plug/lsp/lsp.nix
    ./plug/lsp/lspsaga.nix

    ./plug/lsp/tiny_diagnostic.nix

    ./plug/snippets/luasnip.nix

    ./plug/statusline/lualine.nix

    ./plug/treesitter/treesitter-context.nix
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
    #   ./plug/utils/fzf.nix
    ./plug/utils/indent.nix
    ./plug/utils/toggleterm.nix
    ./plug/utils/colorizer.nix
    ./plug/utils/nvim-autotag.nix
    ./plug/utils/markdown-prev.nix
    ./plug/utils/lz-n.nix
    ./plug/utils/mini-nvim/default.nix
    ./plug/ui/transparent.nix

    # debugger
  ];
  options = {
    theme = lib.mkOption {
      default = "gruvbox";
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
        "gruvbox_mt_hard"
        "kanagawa-waves"
        "nord-chime"
      ];
    };
  };

  config = {
    theme = "gruvbox_mt_hard";
    extraConfigLua =
      lib.mkIf (config.theme != "gruvbox_mt_hard")
      ''
        _G.theme = "${config.theme}"
      '';
  };
}

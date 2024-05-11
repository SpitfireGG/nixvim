{ config, lib, ... }: {
  imports = [
    ./keys.nix
    ./sets.nix
    ./highlight.nix
    ./clipboard.nix

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
    ./plug/lsp/hlchunk.nix
    ./plug/lsp/lsp.nix
    ./plug/lsp/lspsaga.nix
    ./plug/lsp/trouble.nix
    ./plug/lsp/per/rustaceans.nix
    ./plug/lsp/per/clang.nix
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
    ./plug/ui/indent.nix

    ./plug/utils/comment.nix
    ./plug/utils/flash.nix
    ./plug/utils/grapple.nix
    ./plug/utils/illuminate.nix
    ./plug/utils/nvim-autopairs.nix
    ./plug/utils/oil.nix
    ./plug/utils/undotree.nix
    ./plug/utils/ufo.nix
    ./plug/utils/whichkey.nix
    ./plug/utils/toggleterm.nix
    ./plug/utils/fzf.nix
    ./plug/utils/sorround.nix
  ];
  options = {
    theme = lib.mkOption {
      default = "paradise";
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
      ];
    };
  };
  config = {
    theme = "paradise";
    extraConfigLua = ''
      _G.theme = "${config.theme}"
    '';
  };
}

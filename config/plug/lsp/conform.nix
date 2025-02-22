{
  plugins.conform-nvim = {
    enable = true;
    autoLoad = true;
    settings = {
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
        stopAfterFirst = true;
      };
      notifyOnError = true;
      formattersByFt = {
        liquidsoap = [ "liquidsoap-prettier" ];
        html = [ [ "prettierd" ] ];
        css = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        javascript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        javascriptreact = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescriptreact = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [
          "alejandra"
          "nixfmt"
        ];
        markdown = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        yaml = [
          "yamllint"
          "yamlfmt"
        ];
      };
    };
  };
}

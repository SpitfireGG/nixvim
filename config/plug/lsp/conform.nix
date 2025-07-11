{
  lib,
  pkgs,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;
    autoLoad = true;
    settings = {
      default_format_opts.lsp_format = "never";
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
        stopAfterFirst = true;
        log_level = "warn";
      };

      notifyOnError = true;
      formattersByFt = {
        liquidsoap = ["liquidsoap-prettier"];
        html = [["prettierd"]];

        c = [["clang"]];
        assembly = [["asmfmt"]];

        /*
           c_sharp = [["csharpier"]];
        c-sharp = [["csharpier"]];
        csharp = [["csharpier"]];
        */

        cs = [["csharpier"]];

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
        python = ["black"];
        lua = ["stylua"];
        nix = ["${lib.getExe pkgs.alejandra}"];
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
        bash = ["shfmt"];
      };
    };
  };
}

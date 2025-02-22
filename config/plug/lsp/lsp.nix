{
  plugins = {
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      servers = {
        eslint = {
          enable = true;
        };
        html = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        nixd = {
          enable = true;
        };
        marksman = {
          enable = false;
        };
        pyright = {
          enable = false;
        };
        gopls = {
          enable = true;
        };
        terraformls = {
          enable = false;
        };
        ts_ls = {
          enable = true;
        };
        clangd = {
          enable = true;
        };
        zls = {
          enable = true;
        };
        rust_analyzer = {
          enable = true;
          installRustc = true;
          installCargo = true;
        };
        htmx = {
          enable = true;
        };
        bashls = {
          enable = true;
        };
        hls = {
          enable = false;
        };
        yamlls = {
          enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>zz" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraConfigLua = ''





    local _border = "rounded"
    local signs = { Error = "𝝨 ", Warn = "𝝍 ", Hint = "𝝓 ", Info = "𝝮 " }


    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
          virtual_text = {
        prefix = " ", -- Could be '■', '▎', 'x'
    },
      float={
        border=_border,
         focus = true,
        focusable = false,
        style = "minimal",
        source = "always",
        border = "rounded",
        suffix = "",
        header = { "  Checkup" },
        prefix = function(_, _, _)
            return "  ", "String"
        end,
        }
    };
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}

{
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      servers = {
        # Other servers remain unchanged
        eslint.enable = false;
        qmlls = {
          enable = true;
          cmd = [
            "qmlls"
            "-E"
          ];
        };
        lua_ls.enable = false;
        gopls.enable = true;
        ts_ls.enable = false;
        clangd.enable = true;
        omnisharp.enable = false;
        asm_lsp = {
          enable = false;
          filetypes = [
            "s"
            "asm"
            "S"
          ];
          cmd = [ "asm-lsp" ];
        };
        bashls = {
          enable = true;
          autostart = true;
          # Add explicit settings for bashls
          settings = {
            # Enable shellcheck support (requires shellcheck package)
            shellcheck = {
              enable = true;
              # Optional: path to shellcheck if not in PATH
              executablePath = "${lib.getExe pkgs.shellcheck}";
            };
            # Enable shfmt support (requires shfmt package)
            shfmt = {
              enable = true;
              # Optional: path to shfmt if not in PATH
              executablePath = "${lib.getExe pkgs.shfmt}";
              # Optional: set default shfmt options
              shfmtArguments = [
                "-i"
                "2"
              ]; # Example: use 2 spaces for indentation
            };
            # Optional: Specify the default shell dialect
            # bashArgv = ["--dialect" "bash"];
            # Optional: Configure hover to show more details
            hover = {
              displayFormat = "plaintext"; # or "markdown"
              showKeywords = true;
              showBuiltins = true;
              showExternalCommands = true;
            };
            # More settings can be found in bashls documentation
            # e.g., analysis options, highlight references etc.
          };
        };

        yamlls.enable = true;

        # Improved xdNixNix LSP config - using just nixd
        # nixd is generally more feature-complete than nil_ls
        nixd = {
          enable = true;
          settings = {
            formatting = {
              command = [ "${lib.getExe pkgs.alejandra}" ];
            };
            # Enable evaluation for improved experience
            evaluation = {
              enable = true;
              followImports = true;
            };
            # Complete code completions including builtins, pkgs, lib
            completion = {
              enable = true;
              enableAuto = true;
              importStrategy = "recursive"; # Will index all imported modules
            };
            hover = {
              enable = true;
            };
            documentLink = {
              enable = true;
            };
            definition = {
              enable = true;
            };
            references = {
              enable = true;
            };
            documentSymbol = {
              enable = true;
            };
            codeAction = {
              enable = true;
            };
            inlayHint = {
              enable = true;
            }; # Display types/values inline
          };
        };

        # Disable nil_ls to avoid conflicts
        nil_ls.enable = true;
      };

      # Your keymaps section remains unchanged
      keymaps = {
        silent = true;
        lspBuf = {
          # Keymaps preserved as in original config
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
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Action";
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

    # Add nvim-cmp configuration to improve completion experience
  };

  # Keep your existing Lua configuration
  extraConfigLua = ''
    local _border = "rounded"

    --[[ vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    ) ]]


    vim.lsp.handlers["textDocument/hover"] = function() end

    vim.lsp.handlers["textDocument/signatureHelp"] = function() end

    --[[ vim.diagnostic.config{
      virtual_text = {
        enable = false;
      },
      float={
        border=_border,
        focus = true,
        focusable = false,
        style = "minimal",
        source = "always",
        border = "rounded",
        suffix = "",
        header = { "  Checkup" },
        prefix = function(_, _, _)
          return "  ", "String"
        end,
      }
    }; ]]


    local signs = { Error = "𝝨 ", Warn = "𝝍 ", Hint = "𝝓 ", Info = "𝝮 " }

      vim.diagnostic.config({
                    signs = {
                text = {
                        [vim.diagnostic.severity.ERROR] = signs.Error,
                        [vim.diagnostic.severity.WARN] = signs.Warn,
                        [vim.diagnostic.severity.INFO] = signs.Info,
                        [vim.diagnostic.severity.HINT] = signs.Hint,
                },
                numhl = {
                      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
                },
        },
        })

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
       vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          if client.name == "nixd" then
            client.server_capabilities.semanticTokensProvider = nil

            print("Nixd LSP attached. Semantic tokens disabled.")
          elseif client.name == "clangd" then
             print("Clangd LSP attached.") -- logging
          end

           vim.api.nvim_buf_set_keymap(args.buf, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { silent = true, desc = 'Code Action' })
           vim.api.nvim_buf_set_keymap(args.buf, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { silent = true, desc = 'Hover' })
           if client.name == "clangd" then
               vim.api.nvim_buf_set_keymap(args.buf, 'n', '<leader>cc', '<cmd>lua vim.lsp.buf.call_hierarchy()<CR>', { silent = true, desc = 'Call Hierarchy' })
               vim.api.nvim_buf_set_keymap(args.buf, 'n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_hierarchy()<CR>', { silent = true, desc = 'Type Hierarchy' })
           end


        end
      end,
      group = vim.api.nvim_create_augroup("LspAttachClangd", { clear = true }),
      pattern = "{c,h,objc,cuda,vert,frag}",
    })
  '';
}

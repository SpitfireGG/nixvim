{
  config,
  lib,
  ...
}:
let
  colors = import ../../colors/${config.theme}.nix { };
in
{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        highlights = lib.mkIf config.colorschemes.base16.enable {
          fill = {
            fg = colors.base00;
            bg = colors.base00;
          };
          background = {
            fg = colors.base03;
            bg = colors.base00;
          };
          buffer_selected = {
            fg = colors.base05;
            bg = colors.base00;
            italic = false;
          };
          modified = {
            fg = colors.base03;
            bg = colors.base00;
          };
          tab_selected = {
            fg = colors.base00;
            bg = colors.base00;
          };
        };
        options = {
          separatorStyle = "thick"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin
          keymaps = [
            {
              mode = "n";
              key = "<Tab>";
              action = "<cmd>BufferLineCycleNext<cr>";
              options = {
                desc = "Cycle to next buffer";
              };
            }

            {
              mode = "n";
              key = "<S-Tab>";
              action = "<cmd>BufferLineCyclePrev<cr>";
              options = {
                desc = "Cycle to previous buffer";
              };
            }

            {
              mode = "n";
              key = "<S-l>";
              action = "<cmd>BufferLineCycleNext<cr>";
              options = {
                desc = "Cycle to next buffer";
              };
            }

            {
              mode = "n";
              key = "<S-h>";
              action = "<cmd>BufferLineCyclePrev<cr>";
              options = {
                desc = "Cycle to previous buffer";
              };
            }

            {
              mode = "n";
              key = "<leader>bd";
              action = "<cmd>bdelete<cr>";
              options = {
                desc = "Delete buffer";
              };
            }

            {
              mode = "n";
              key = "<leader>bb";
              action = "<cmd>e #<cr>";
              options = {
                desc = "Switch to Other Buffer";
              };
            }

            # {
            #   mode = "n";
            #   key = "<leader>`";
            #   action = "<cmd>e #<cr>";
            #   options = {
            #     desc = "Switch to Other Buffer";
            #   };
            # }

            {
              mode = "n";
              key = "<leader>br";
              action = "<cmd>BufferLineCloseRight<cr>";
              options = {
                desc = "Delete buffers to the right";
              };
            }

            {
              mode = "n";
              key = "<leader>bl";
              action = "<cmd>BufferLineCloseLeft<cr>";
              options = {
                desc = "Delete buffers to the left";
              };
            }

            {
              mode = "n";
              key = "<leader>bo";
              action = "<cmd>BufferLineCloseOthers<cr>";
              options = {
                desc = "Delete other buffers";
              };
            }

            {
              mode = "n";
              key = "<leader>bp";
              action = "<cmd>BufferLineTogglePin<cr>";
              options = {
                desc = "Toggle pin";
              };
            }

            {
              mode = "n";
              key = "<leader>bP";
              action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
              options = {
                desc = "Delete non-pinned buffers";
              };
            }
          ];
        };
      };
    };
  };
}

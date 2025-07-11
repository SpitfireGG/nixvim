{
  config,
  lib,
  ...
}:
let
  colors = import ../../colors/gruvbox_mt_hard.nix { };
in
{
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        highlights = lib.mkIf config.colorschemes.base16.enable {
          # Main background for the entire bufferline area
          fill = {
            fg = colors.base00;
            bg = colors.base00;
          };
          # Default background for inactive buffers
          background = {
            fg = colors.base04; # Slightly darker text for inactive
            bg = colors.base01; # A subtle darker background for inactive buffers
          };
          # Highlight for the currently selected buffer
          buffer_selected = {
            fg = colors.base08; # Light text for contrast
            bg = null; # A vibrant accent color for the active buffer
            bold = true; # Make it bold
            italic = true;
          };
          # Highlight for modified buffers
          modified = {
            # Changed from colors.base09 (yellow/orange) to colors.base0B (green)
            fg = colors.base08; # Muted green for modified status (less eye-catching for Gruvbox)
            bg = colors.base01;
          };
          # Highlight for selected and modified buffer
          # Highlight for tabs (if you use them)
          tab_selected = {
            fg = null;
            bg = colors.base0A;
            bold = true;
          };
          tab_close = {
            fg = colors.base04;
            bg = colors.base00;
          };
        };
        options = {
          separatorStyle = "padded_slant";
          show_buffer_close_icons = false;
          show_buffer_icons = true;
          show_tab_indicators = false;

          offsets = [
            {
              filetype = "NvimTree";
              text = "󰔶 File Explorer ";
              text_align = "left";
              separator = true;
            }
          ];
          modified_icon = "󰊠";
          show_duplicate_paths = 2;
          # diagnostics = "nvim_lsp";
          /*
               diagnostics_indicator = {
              __raw = ''
                function(count, level, diagnostics_dict, context)
                  local s = " "
                  for e, n in pairs(diagnostics_dict) do
                    local sym = ""
                    if e == "error" then sym = " "
                    elseif e == "warn" then sym = " "
                    elseif e == "info" then sym = " "
                    elseif e == "hint" then sym = "󰠠 "
                    end
                    s = s .. sym .. n .. " "
                  end
                  return s
                end
              '';
            };
          */
          /*
               diagnostics_update_on_insert = false;
            diagnostics_indicator_options = {
              place = "buffer_name";
            };
          */
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

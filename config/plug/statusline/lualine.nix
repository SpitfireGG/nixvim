{ config, ... }:

let

  colors = import ../../colors/gruvbox_mt_hard.nix { };

in

{

  plugins.lualine = {

    enable = true;

    lazyLoad.settings.event = "BufEnter";

    settings = {

      options = {

        component_separators = {

          left = " ";

          right = " ";

        };


        section_separators = {

          left = "";

          right = "";

        };


        theme = {

          normal = {

            a = {

              fg = colors.base00;

              bg = colors.base0A;

              gui = "bold";

            };

            b = {

              fg = colors.base07;

              bg = colors.base02;

            };

            c = {

              fg = colors.base05;

              bg = colors.base00;

            };

            x = {

              fg = colors.base0D;

              bg = colors.base01;

            };

            y = {

              fg = colors.base06;

              bg = colors.base02;

            };

            z = {

              fg = colors.base00;

              bg = colors.base0B;

              gui = "bold";

            };

          };

          insert = {

            a = {

              fg = colors.base00;

              bg = colors.base0C;

              gui = "bold";

            };

          };

          visual = {

            a = {

              fg = colors.base00;

              bg = colors.base0D;

              gui = "bold";

            };

          };

          replace = {

            a = {

              fg = colors.base07;

              bg = colors.base08;

              gui = "bold";

            };

          };

          command = {

            a = {

              fg = colors.base00;

              bg = colors.base0E;

              gui = "bold";

            };

          };

        };

        globalstatus = true;

        disabled_filetypes = {

          statusline = [

            "dashboard"

            "alpha"

            "starter"

            "snacks_dashboard"

          ];

        };

      };

      inactive_sections = {

        lualine_x = [

          "filename"

        ];

      };

      sections = {

        lualine_a = [

          {

            __unkeyed = "mode";

            fmt = "string.upper";

            color = {

              fg = colors.base00;

              bg = colors.base0A;

              gui = "bold";

            };

            separator.right = "";

          }

        ];

        lualine_b = [

          {

            __unkeyed = "branch";

            icon.__unkeyed = "";

            color = {

              fg = colors.base0B;

            };

            separator.right = "";

          }

          {

            __unkeyed = {

              __raw = ''

                function()

                    local msg = ""

                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')

                    local clients = vim.lsp.get_clients()

                    if next(clients) == nil then

                        return msg

                    end

                    for _, client in ipairs(clients) do

                        local filetypes = client.config.filetypes

                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then

                            return client.name

                        end

                    end

                    return msg

                end

              '';

            };

            icon.__unkeyed = " ";

            color = {

              fg = colors.base0C;

            };

          }

        ];

        lualine_c = [

          {

            __unkeyed = "filename";

            path = 1;

            color = {

              fg = colors.base05;

            };

          }

        ];

        lualine_x = [

          {

            __unkeyed = "filetype";

            icon.__unkeyed = "󰈔";

            color = {

              fg = colors.base0D;

            };

          }

          {

            __unkeyed = "encoding";

            icon.__unkeyed = "󰣖";

            color = {

              fg = colors.base04;

            };

          }

          {

            __unkeyed = "fileformat";

            icon.__unkeyed = "";

            color = {

              fg = colors.base04;

            };

          }

        ];

        lualine_y = [

          {

            __unkeyed = "diff";

            symbols = {

              added = " ";

              modified = " ";

              removed = " ";

            };

            color = {

              add = colors.base0B;

              minus = colors.base08;

              change = colors.base09;

            };

            separator.left = "";

          }

          {

            __unkeyed = "diagnostic";

            symbols = {

              error = " ";

              warn = " ";

              info = " ";

              hint = "󰝶 ";

            };

            color = {

              error = colors.base08;

              warn = colors.base0A;

              info = colors.base0D;

              hint = colors.base0C;

            };

          }

        ];

        lualine_z = [

          {

            __unkeyed = "location";

            color = {

              fg = colors.base00;

              bg = colors.base0B;

              gui = "bold";

            };

            separator.left = "";

          }

          {

            __unkeyed = {

              __raw = ''

                function()

                  local chars = setmetatable({

                    '󰝤 ', '󰝥 ', '󰝦 ', '󰝧 ', '󰝨 ', '󰝩 ', '󰝪 ', '󰝫 ', '󰝬 ', '󰝭 ',

                    '󰝮 ', '󰝯 ', '󰝰 ', '󰝱 ', '󰝲 ', '󰝳 ', '󰝴 ', '󰝵 ', '󰝶 ', '󰝷 ',

                  }, { __index = function() return '󰝶 ' end })

                  local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)

                  local position = math.floor(line_ratio * 100)


                  local icon = chars[math.floor(line_ratio * #chars) + 1] .. position .. "%%" -- Added percentage

                  if position <= 5 then

                    icon = ' TOP'

                  elseif position >= 95 then

                    icon = ' BOT'

                  end

                  return icon

                end

              '';

            };

            color = {

              fg = colors.base00;

              bg = colors.base0B;

              gui = "bold";

            };

            padding = 0;

          }

        ];

      };

    };

  };

}



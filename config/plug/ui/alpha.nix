{
  plugins.alpha = let
    nixFlake = [
      " "

      "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
      "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
      "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
      "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
      "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
      "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
    ];
  in {
    enable = true;
    layout = [
      {
        type = "padding";
        val = 4;
      }
      {
        opts = {
          hl = "AlphaHeader";
          position = "center";
        };
        type = "text";
        val = nixFlake;
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = let
          mkButton = shortcut: cmd: val: hl: {
            type = "button";
            inherit val;
            opts = {
              inherit hl shortcut;
              keymap = [
                "n"
                shortcut
                cmd
                {}
              ];
              position = "center";
              cursor = 0;
              width = 40;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          };
        in [
          (
            mkButton
            "F"
            "<CMD>FzfLua live_grep<CR>"
            " Find text"
            "String"
          )

          (
            mkButton
            "ff"
            "<CMD>FzfLua files<CR>"
            " Find files"
            "String"
          )
          (
            mkButton
            "n"
            "ene <BAR>startinsert<CR>"
            " Find files"
            "String"
          )

          (
            mkButton
            "f"
            "<CMD>lua require('telescope').extensions.Projects()<CR>"
            " Find Projects"
            "Operator"
          )
          (
            mkButton
            "q"
            "<CMD>qa<CR>"
            " Quit Neovim"
            "String"
          )
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "GruvboxBlue";
          position = "center";
        };
        type = "text";
        val = "https://github.com/spitfiregg";
      }
    ];
  };

  extraConfigLua = ''

    local function getGreeting(name)
    	local tableTime = os.date("*t")
    	local hour = tableTime.hour
    	local greetingsTable = {
    		[1] = "  Sleep well",
    		[2] = "  Good morning",
    		[3] = "  Good afternoon",
    		[4] = "  Good evening",
    		[5] = "望 Good night",
    	}
    	local greetingIndex = 0
    	if hour == 23 or hour < 7 then
    		greetingIndex = 1
    	elseif hour < 12 then
    		greetingIndex = 2
    	elseif hour >= 12 and hour < 18 then
    		greetingIndex = 3
    	elseif hour >= 18 and hour < 21 then
    		greetingIndex = 4
    	elseif hour >= 21 then
    		greetingIndex = 5
    	end
    	return greetingsTable[greetingIndex] .. ", " .. name
    end

    local userName = "Kenzo | Spitfire"
    local greeting = getGreeting(userName)

    local greetHeading = {
    	type = "text",
    	val = greeting,
    	opts = {
    		position = "center",
    		hl = "String",
    	},
    }
  '';
}

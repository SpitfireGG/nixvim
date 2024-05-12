{
  plugins.nvim-colorizer = {
    enable =  true;
    
      	userDefaultOptions = {
		RGB = true; # #RGB hex codes
		RRGGBB = true; # #RRGGBB hex codes
		names = true; # "Name" codes like Blue or blue
		RRGGBBAA = true; # #RRGGBBAA hex codes
		rgb_fn = true; # CSS rgb() and rgba() functions
		hsl_fn = true; # CSS hsl() and hsla() functions
		css = true; # Enable all CSS features: rgb_fn; hsl_fn; names; RGB; RRGGBB
		css_fn = false; # Enable all CSS *functions*: rgb_fn; hsl_fn
		# Available modes for `mode`: foreground; background;  virtualtext
		mode = "background"; # Set the display mode.
		tailwind = true; # Enable tailwind colors
		virtualtext = "■";
	};
    };
}

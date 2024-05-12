{
  plugins.toggleterm = {
    enable  = true;
    extraOptions = {
      auto_scroll = true; 
      autochdir = true;
      close_on_exit = true;
      direction = "horizontal";   
      hide_numbers = true;
      highlights =       { NormalFloat.link = "Normal"; FloatBorder.link = "Normal"; StatusLine.gui = "NONE"; StatusLineNC = { cterm = "italic"; gui = "NONE"; }; };
      open_mapping = "[[m-1]]";
      persist_mode = true;
      size = 15;
      float_opts.border = "single";

    };
  };
}

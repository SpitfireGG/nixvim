{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = "▏";
      };
      scope = {
        show_start = false;
        show_end = false;
      };
      exclude = {
        buftypes = [
          "terminal"
          "quickfix"
        ];
        filetypes = [
          ""
          "checkhealth"
          "help"
          "lspinfo"
          "packer"
          "TelescopePrompt"
          "TelescopeResults"
          "yaml"
        ];
      };
    };
  };
}

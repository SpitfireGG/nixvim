{
  plugins.clangd-extensions = {
    enable = true;
    enableOffsetEncodingWorkaround = true;
    settings = {
      ast = {
        role_icons = {
          declaration = "";
          expression = "";
          specifier = "";
          statement = "";
          "template argument" = "";
          type = "";
        };
      };

     
      memory_usage.border = null;
    };
  };
}

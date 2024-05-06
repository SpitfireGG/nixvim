{
  plugins.clangd-extensions = {
    enable = true;
    enableOffsetEncodingWorkaround = true;
    inlayHints = {
      highlight = "Comment";
      showParameterHints = true;

      parameter_hints_prefix = "<- ";
      other_hints_prefix = "=> ";
      max_len_align = false;
      max_len_align_padding = 1;

      right_align = false;
      right_align_padding = 7;

      memoryUsage.border = null;
      symbol_info = null;
    };
  };
}

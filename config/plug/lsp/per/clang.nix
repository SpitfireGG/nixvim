{
  plugins.clangd-extensions = {
    enable = true;
    enableOffsetEncodingWorkaround = true;
    inlayHints = {
      highlight = "Comment";
      showParameterHints = true;

      parameterHintsPrefix = "<- ";
      otherHintsPrefix = "=> ";
      maxLenAlign = false;
      maxLenAlignPadding = 1;

      rightAlign = false;
      rightAlignPadding = 7;
    };
    memoryUsage.border = null;
  };
}

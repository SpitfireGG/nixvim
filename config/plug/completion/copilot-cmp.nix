{
  plugins.copilot-cmp = {
    enable = true;
  };
  plugins.copilot-lua = {
    enable = true;
    settings = {
      event = [
        "InsertEnter"
        "LspAttach"
      ];
      fix_pairs = false;

      suggestion = {
        enabled = false;
      };
      panel = {
        enabled = false;
      };
    };
  };

  /*
    extraConfigLua = ''
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    '';
  */
}

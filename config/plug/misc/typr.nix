{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "volt";
      src = inputs.volt-nvim;
    })
    (pkgs.vimUtils.buildVimPlugin {
      name = "typr";
      src = inputs.typr-nvim;
    })
  ];

  # Optional Lua setup
  extraConfigLua = ''
    require("typr").setup({})
  '';
}

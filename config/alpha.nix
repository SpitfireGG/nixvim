{ nixvimUtils, ... }:

let
  nixvim = nixvimUtils.nixvimRevision.nixvim;
in
{
  extraConfigLua = builtins.readFile ./plug/ui/alpha.lua;
}

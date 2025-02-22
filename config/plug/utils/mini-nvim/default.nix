{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules.icons = { };
  };
  imports = [
    ./pairs.nix
    ./surround.nix
    ./bracket.nix
    ./files.nix
  ];
}

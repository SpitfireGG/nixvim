{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nixd
    nixdoc
  ];
}

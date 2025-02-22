{
  description = "A nixvim configuration with custom plugins";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    /*
      typr-nvim = {
        url = "github:nvzone/typr";
        flake = false;
      };
      volt-nvim = {
        url = "github:nvzone/volt";
        flake = false;
      };
    */
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        # Import nixpkgs for the current system
        pkgs = import nixpkgs { inherit system; };

        # NixVim utilities
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};

        # Define the config module with all required arguments
        configModule =
          {
            lib,
            config,
            pkgs,
            ...
          }:
          (import ./config {
            inherit
              inputs
              lib
              config
              pkgs
              ;
          });

        # Build NixVim with the module
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = configModule;
        };
      in
      {
        formatter = pkgs.nixpkgs-fmt;

        checks = {
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "My nixvim configuration";
          };
        };

        packages = {
          default = nvim;
        };

        devShells.default = import ./shell.nix { inherit pkgs; };
      }
    );
}

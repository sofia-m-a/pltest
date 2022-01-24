
{
  description = "pltest";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/a3d847c3bd3a3b75b3057d7b3730d3308dd8fd59";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    souffle-haskell.url = "github:luc-tielen/souffle-haskell";
  };
  outputs = inputs@{ self, nixpkgs, flake-utils, souffle-haskell, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "x86_64-darwin" "aarch64-darwin" ] (system:
      let
        overlays = [ ]
          ++ souffle-haskell.overlays.${system} # bring in souffle/souffle-haskell
          ++ [ (self: super: {
                 haskellPackages = super.haskellPackages.override {
                   overrides = hself: hsuper: {
                     souffle-haskell = super.souffle-haskell;
                   };
                 };
               })
             ] # this overlay is necessary because github:luc-tielen/souffle-haskell doesn't stick these in haskellPackages
          ;
        pkgs =
          import nixpkgs { inherit system overlays; config.allowBroken = true; };

        # https://github.com/NixOS/nixpkgs/issues/140774#issuecomment-976899227
        m1MacHsBuildTools =
          pkgs.haskellPackages.override {
            overrides = self: super:
              let
                workaround140774 = hpkg: with pkgs.haskell.lib;
                  overrideCabal hpkg (drv: {
                    enableSeparateBinOutput = false;
                  });
              in
              {
                ghcid = workaround140774 super.ghcid;
                ormolu = workaround140774 super.ormolu;
              };
          };
        project = returnShellEnv:
          pkgs.haskellPackages.developPackage {
            inherit returnShellEnv;
            name = "pltest";
            root = ./.;
            withHoogle = false;
            overrides = self: super: with pkgs.haskell.lib; {

            };
            modifier = drv:
              pkgs.haskell.lib.addBuildTools drv
                (with (if system == "aarch64-darwin"
                then m1MacHsBuildTools
                else pkgs.haskellPackages); [
                  # Specify your build/dev dependencies here.
                  cabal-fmt
                  cabal-install
                  ghcid
                  haskell-language-server
                  ormolu
                  pkgs.souffle

                  pkgs.nixpkgs-fmt
                ]);
          };
      in
      {
        # Used by `nix build` & `nix run` (prod exe)
        defaultPackage = project false;

        # Used by `nix develop` (dev shell)
        devShell = project true;
      });
}

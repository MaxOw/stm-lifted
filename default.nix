{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc863" }:
let ghc = nixpkgs.haskell.packages.${compiler};
    tools = with ghc; [ cabal-install ghcid ];
    overrideCabal = pkg: nixpkgs.haskell.lib.overrideCabal pkg
      ({buildDepends ? [], ...}: {
        buildDepends = buildDepends ++ tools;
      });
    cabal2nixResult = src: nixpkgs.runCommand "cabal2nixResult" {
      buildCommand = ''
        cabal2nix file://${src} > $out
      '';
      buildInputs = [ nixpkgs.cabal2nix ];
    } "";
    package = ghc.callPackage (cabal2nixResult ./.) { };
    drv = overrideCabal package;
in if nixpkgs.lib.inNixShell then drv.env else drv

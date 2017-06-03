{ nixpkgs ? import <nixpkgs> {}, compiler }:
nixpkgs.haskell.packages.${compiler}.callPackage ./stm-lifted.nix { }

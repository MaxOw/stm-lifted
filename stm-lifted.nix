{ mkDerivation, base, stdenv, stm, transformers }:
mkDerivation {
  pname = "stm-lifted";
  version = "0.1.1.0";
  src = ./.;
  libraryHaskellDepends = [ base stm transformers ];
  description = "Software Transactional Memory lifted to MonadIO";
  license = stdenv.lib.licenses.bsd3;
}

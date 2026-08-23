{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "greet";
  version = "1.0";

  # (verified by copying this file into the exercise dir, where ./greet exists)
  src = ./greet;

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    install -m755 greet $out/bin/greet
  '';
}

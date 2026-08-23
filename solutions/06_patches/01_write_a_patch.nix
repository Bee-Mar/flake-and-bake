{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "muffin-recipe";
  src = ./muffin;

  patches = [ ./fix-flavor.patch ];

  dontBuild = true;
  installPhase = ''
    mkdir -p $out
    cp recipe.txt $out/
  '';
}

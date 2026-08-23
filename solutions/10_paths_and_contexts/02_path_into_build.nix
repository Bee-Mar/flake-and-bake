{ pkgs, ... }:
pkgs.runCommand "ingredient" { } ''
  cp ${./secret-ingredient.txt} $out
''

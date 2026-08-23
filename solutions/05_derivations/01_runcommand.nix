{ pkgs, ... }:
pkgs.runCommand "bake-temperature" { } ''
  mkdir -p $out
  echo "baked at 350 degrees" > $out/temperature
''

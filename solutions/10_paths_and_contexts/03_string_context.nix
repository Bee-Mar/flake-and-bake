{ pkgs, ... }:
pkgs.runCommand "greeting" { } ''
  ${pkgs.hello}/bin/hello > $out
''

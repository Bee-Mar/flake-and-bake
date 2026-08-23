# LESSON: Welcome to real builds! A derivation is a build recipe; realizing
# it produces a store path. The simplest maker is pkgs.runCommand:
#   pkgs.runCommand "name" { } ''shell script writing to $out''
# $out is YOUR job to create — a build that doesn't produce $out fails.
#
# From here on, `bake` actually runs `nix build` and inspects the output.
#
# TASK: Make the build write the text "baked at 350 degrees" into a file
# $out/temperature. (Note: $out is a bare directory path — `mkdir -p $out`
# first!)

# I AM NOT DONE

{ pkgs, ... }:
pkgs.runCommand "bake-temperature" { } ''
  echo "TODO"
''

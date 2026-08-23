# LESSON: builtins.readDir lists a directory:
#   readDir ./hosts → { "alpha.nix" = "regular"; "beta.nix" = "regular"; ... }
# Combined with import, this gives the beloved "drop a file in the dir and
# it's registered" pattern for NixOS hosts, packages, modules:
#
#   name -> import (dir + "/${name}")   for every *.nix file
#
# Useful: lib.filterAttrs, lib.mapAttrs', lib.nameValuePair,
#         lib.removeSuffix ".nix"
#
# TASK: Auto-import every .nix file in ./hosts into an attrset keyed by
# hostname (filename minus .nix). Note ./hosts also contains a README.md to
# filter out! Expected:
#   { alpha = { cores = 4; }; beta = { cores = 8; }; }

# I AM NOT DONE

{ lib, ... }:
let
  dir = ./hosts;
  entries = builtins.readDir dir;
in
entries   # filter to .nix files, then mapAttrs' to { name-sans-.nix = import ...; }

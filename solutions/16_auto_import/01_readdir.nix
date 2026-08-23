{ lib, ... }:
let
  dir = ./hosts;
  entries = builtins.readDir dir;
  nixFiles = lib.filterAttrs (name: type: type == "regular" && lib.hasSuffix ".nix" name) entries;
in
lib.mapAttrs'
  (name: _: lib.nameValuePair (lib.removeSuffix ".nix" name) (import (dir + "/${name}")))
  nixFiles

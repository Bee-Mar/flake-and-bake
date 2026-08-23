{ lib, ... }:
let
  result = lib.evalModules {
    modules = [
      { options.temperature = lib.mkOption { type = lib.types.int; }; }
      { temperature = 350; }
      { temperature = lib.mkForce 425; }
    ];
  };
in
result.config.temperature

{ lib, ... }:
let
  result = lib.evalModules {
    modules = [
      {
        options.greeting = lib.mkOption {
          type = lib.types.str;
          default = "hi";
        };
      }
      { config.greeting = "hello, modules"; }
    ];
  };
in
result.config.greeting

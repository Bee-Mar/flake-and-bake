{ lib, ... }:
let
  result = lib.evalModules {
    modules = [
      {
        options.bakery.enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
        };
        options.packages = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };
      }

      ({ config, ... }: {
        config.packages = lib.mkIf config.bakery.enable [ "oven" "rolling-pin" ];
      })

      { bakery.enable = true; }
    ];
  };
in
result.config.packages

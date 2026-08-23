{ lib, ... }:
let
  result = lib.evalModules {
    modules = [
      {
        options.port = lib.mkOption { type = lib.types.int; };
        options.extraFlags = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };
      }
      { port = 8080; extraFlags = [ "-v" ]; }
      { extraFlags = [ "--color" ]; }
    ];
  };
in
{
  port = result.config.port;
  flags = result.config.extraFlags;
}

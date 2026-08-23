{ lib, ... }:
let
  toml = builtins.fromTOML (builtins.readFile ./bakery.toml);

  result = lib.evalModules {
    modules = [
      {
        options.temperature = lib.mkOption { type = lib.types.int; };
        options.mode = lib.mkOption {
          type = lib.types.enum [ "convection" "conventional" ];
          default = "convection";
        };
        options.batches = lib.mkOption {
          type = lib.types.listOf (lib.types.attrsOf lib.types.anything);
          default = [ ];
        };
      }
      { config = toml; }
    ];
  };
in
{
  temperature = result.config.temperature;
  mode = result.config.mode;
  batchNames = map (b: b.name) result.config.batches;
}

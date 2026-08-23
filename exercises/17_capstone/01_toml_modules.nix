# CAPSTONE: TOML-driven, module-validated configuration — chapters 08 + 14
# combined, and a genuinely production-grade pattern: TOML holds the data
# humans edit; the module system supplies types, defaults, and validation.
#
# ./bakery.toml sets temperature and batches, but NOT mode — the option's
# default should fill that in. That's the payoff: TOML stays minimal, the
# module system backfills and type-checks.
#
# TASK: Two fixes:
#   1. Feed the TOML in: the second module should be `{ config = toml; }`.
#   2. `mode` needs a default of "convection" (and only allows
#      "convection" or "conventional" — use types.enum).
# Expected: { temperature = 375; mode = "convection";
#             batchNames = [ "sourdough" "focaccia" ]; }

# I AM NOT DONE

{ lib, ... }:
let
  toml = builtins.fromTOML (builtins.readFile ./bakery.toml);

  result = lib.evalModules {
    modules = [
      {
        options.temperature = lib.mkOption { type = lib.types.int; };
        options.mode = lib.mkOption {
          type = lib.types.str;
          # no default!
        };
        options.batches = lib.mkOption {
          type = lib.types.listOf (lib.types.attrsOf lib.types.anything);
          default = [ ];
        };
      }
      { config = { }; }   # the TOML goes here
    ];
  };
in
{
  temperature = result.config.temperature;
  mode = result.config.mode;
  batchNames = map (b: b.name) result.config.batches;
}

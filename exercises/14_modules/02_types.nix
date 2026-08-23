# LESSON: Options are TYPED: lib.types.str, int, bool, port, listOf x,
# attrsOf x, enum [...], nullOr x, submodule {...}. The type controls both
# validation AND how multiple definitions MERGE (listOf concatenates,
# attrsOf unions, str refuses to merge two conflicting definitions).
#
# TASK: Two bugs: `port` is declared as a str but set as an int, and
# `extraFlags` should merge list definitions from two modules — but is
# declared as a plain str. Fix both TYPES (not the values).
# Expected: { port = 8080; flags = [ "--color" "-v" ]; }
# (Note the flag order! Anonymous modules' merge order is an implementation
# detail — when order matters, pin it with lib.mkBefore/mkAfter/mkOrder.)

# I AM NOT DONE

{ lib, ... }:
let
  result = lib.evalModules {
    modules = [
      {
        options.port = lib.mkOption { type = lib.types.str; };
        options.extraFlags = lib.mkOption {
          type = lib.types.str;
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

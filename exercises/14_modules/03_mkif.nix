# LESSON: lib.mkIf makes config CONDITIONAL — and unlike a plain `if`, the
# condition may depend on other options without infinite recursion, because
# mkIf is resolved during merging, not during evaluation of the module.
# The classic NixOS shape:
#
#   config = lib.mkIf cfg.enable { ...only applies when enabled... };
#
# TASK: The tools module should contribute its packages ONLY when
# `bakery.enable` is true — wrap its config in mkIf. Then flip enable on.
# Expected: [ "oven" "rolling-pin" ]

# I AM NOT DONE

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

      # the tools module: currently unconditional
      ({ config, ... }: {
        config.packages = [ "oven" "rolling-pin" ];
      })

      # your enablement:
      { bakery.enable = false; }
    ];
  };
in
result.config.packages

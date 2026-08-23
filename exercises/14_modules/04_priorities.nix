# LESSON: When two modules define the same non-mergeable option, you get
# "conflicting definition values". Priorities resolve it:
#   lib.mkDefault v   — priority 1000 (loses to anything explicit)
#   (plain)       v   — priority 100
#   lib.mkForce   v   — priority 50  (beats plain)
# Same-priority conflicts error; lower number wins. mkOverride N v picks any.
#
# TASK: base-module and user-module both set `temperature` at plain
# priority — conflict! You own user-module. Make it win with mkForce.
# Expected: 425

# I AM NOT DONE

{ lib, ... }:
let
  result = lib.evalModules {
    modules = [
      { options.temperature = lib.mkOption { type = lib.types.int; }; }
      { temperature = 350; }                # base-module (not yours; leave it)
      { temperature = 425; }                # user-module (yours)
    ];
  };
in
result.config.temperature

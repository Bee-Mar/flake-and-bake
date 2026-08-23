# LESSON: The MODULE SYSTEM — how NixOS, home-manager, and devenv all work.
# A module declares OPTIONS (typed slots) and/or sets CONFIG (values for
# slots). lib.evalModules merges all modules and type-checks:
#
#   lib.evalModules {
#     modules = [
#       { options.greeting = lib.mkOption { type = lib.types.str;
#                                           default = "hi"; }; }
#       { config.greeting = "hello"; }     # (bare `greeting = ...;` also works)
#     ];
#   }
# → result.config.greeting == "hello"
#
# TASK: The second module sets an option nobody declared ("greetng" —
# typo!), which evalModules rejects. Fix it. Expected: "hello, modules"

# I AM NOT DONE

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
      { config.greetng = "hello, modules"; }
    ];
  };
in
result.config.greeting

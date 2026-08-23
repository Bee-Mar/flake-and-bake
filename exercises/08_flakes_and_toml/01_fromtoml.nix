# LESSON: Nix reads TOML natively — no parser dependency:
#   builtins.fromTOML (builtins.readFile ./config.toml)
# This is a popular pattern for keeping flake configuration declarative and
# non-programmer-editable: the .toml holds the data, the .nix holds the logic.
#
# TASK: Read ./config.toml (in this directory) and evaluate to the value of
# its `oven.temperature` key. Expected: 350.

# I AM NOT DONE

let
  config = { };   # fromTOML + readFile ./config.toml
in
config

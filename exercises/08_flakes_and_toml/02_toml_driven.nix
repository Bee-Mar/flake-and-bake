# LESSON: The real power move: derive Nix structure FROM the TOML. A list of
# [[batch]] tables becomes an attrset of build products; add a batch to the
# TOML and a new package appears — no Nix edits. This is exactly how people
# drive devshell tool lists, host definitions, etc. from a flake's TOML.
#
# TASK: Turn config.batch (a LIST of { name, count } tables from
# ./config.toml) into an attrset mapping name -> "<count> fresh <name>".
# Expected: { muffins = "12 fresh muffins"; scones = "8 fresh scones"; }
# (builtins.listToAttrs takes a list of { name, value } pairs.)

# I AM NOT DONE

let
  config = builtins.fromTOML (builtins.readFile ./config.toml);
in
builtins.listToAttrs (map (b: {
  # each b is { name = ...; count = ...; }
  name = "???";
  value = "???";
}) config.batch)

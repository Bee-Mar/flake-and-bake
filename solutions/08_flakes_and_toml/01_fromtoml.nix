let
  config = builtins.fromTOML (builtins.readFile ./config.toml);
in
config.oven.temperature

let
  config = builtins.fromTOML (builtins.readFile ./config.toml);
in
builtins.listToAttrs (map (b: {
  name = b.name;
  value = "${toString b.count} fresh ${b.name}";
}) config.batch)

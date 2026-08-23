let
  tag = args@{ name, ... }:
    "${name} has ${toString (builtins.length (builtins.attrNames args))} attrs";
in
tag { name = "bake"; version = "2.0"; license = "mit"; }

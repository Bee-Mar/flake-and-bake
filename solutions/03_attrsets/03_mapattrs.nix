let
  versions = { curl = "8.0"; git = "2.44"; };
in
builtins.mapAttrs (name: v: v + "-patched") versions

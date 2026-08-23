let
  fragments = [
    { curl = "7.9"; }
    { git = "2.44"; jq = "1.7"; }
    { curl = "8.0"; }
  ];
in
builtins.foldl' (acc: x: acc // x) { } fragments

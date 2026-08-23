let
  double = x: builtins.trace "doubling ${toString x}" (x * 2);
in
double 21

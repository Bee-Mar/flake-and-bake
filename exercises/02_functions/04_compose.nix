# LESSON: Functions are values — you can pass and return them. Composition
# `compose f g = x: f (g x)` shows up all over nixpkgs (lib.flip, lib.const,
# overlays are function composition at heart!).
#
# TASK: Implement compose. Expected result: 11  (inc (double 5)).

# I AM NOT DONE

let
  compose = f: g: null;   # should be: a function of x applying g, then f
  double = x: x * 2;
  inc = x: x + 1;
in
(compose inc double) 5

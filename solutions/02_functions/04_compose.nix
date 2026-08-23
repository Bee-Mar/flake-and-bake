let
  compose = f: g: x: f (g x);
  double = x: x * 2;
  inc = x: x + 1;
in
(compose inc double) 5

let
  nums = [ 1 2 3 4 5 6 ];
  isEven = x: x - (x / 2) * 2 == 0;
in
builtins.map (x: x * x) (builtins.filter isEven nums)

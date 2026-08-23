# LESSON: Every Nix function takes exactly ONE argument: `x: x + 1`.
# "Multi-argument" functions are curried — functions returning functions:
#   add = a: b: a + b;   # add 2 → (b: 2 + b) → (add 2) 3 → 5
#
# TASK: Write `double` and `addThenDouble` so the result is
#   { doubled = 8; combined = 14; }

# I AM NOT DONE

let
  double = x: x;                  # should multiply by 2
  addThenDouble = a: b: a + b;    # should be double (a + b)
in
{
  doubled = double 4;
  combined = addThenDouble 3 4;
}

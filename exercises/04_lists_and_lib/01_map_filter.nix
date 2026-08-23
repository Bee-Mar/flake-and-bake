# LESSON: Lists are space-separated: [ 1 2 3 ]. The workhorses:
#   builtins.map    (x: ...) list
#   builtins.filter (x: ...) list
# Beware: [ f 1 ] is a TWO-element list (f and 1), not a call — parenthesize:
# [ (f 1) ].
#
# TASK: Keep only even numbers, then square them.
# Expected: [ 4 16 36 ]

# I AM NOT DONE

let
  nums = [ 1 2 3 4 5 6 ];
  isEven = x: x - (x / 2) * 2 == 0;   # integer division trick — no mod builtin!
in
nums   # filter with isEven, then map (x: x * x)

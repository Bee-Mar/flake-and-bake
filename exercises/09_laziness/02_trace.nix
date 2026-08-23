# LESSON: builtins.trace is Nix's printf-debugging: `trace msg value` prints
# msg to stderr, then RETURNS value. Forgetting the second argument is a
# classic mistake — `trace msg` is just a partially-applied function!
# (Also handy: lib.traceVal x — traces x AND returns it.)
#
# TASK: Someone forgot the value argument. This should evaluate to 42
# (and print "doubling 21" while checking — watch bake's output).

# I AM NOT DONE

let
  double = x: builtins.trace "doubling ${toString x}";
in
double 21

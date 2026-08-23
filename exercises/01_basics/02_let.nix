# LESSON: `let ... in <expr>` binds names for use in <expr>.
# Bindings can refer to each other (in any order!) because Nix is lazy —
# nothing is evaluated until it's needed.
#
# TASK: This file should evaluate to 30. Add the missing binding.

# I AM NOT DONE

let
  a = 10;
  c = a + b;
  # something is missing here...
in
c

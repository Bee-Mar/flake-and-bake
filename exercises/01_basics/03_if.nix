# LESSON: `if cond then a else b` is an *expression* — there is no statement
# form and no "if without else". Conditions must be actual booleans:
# `if 1 then ...` is a type error, unlike C or JavaScript.
#
# TASK: Fix the condition so this evaluates to "big".
# (n > 5 is what we mean — but a bare number is not a boolean!)

# I AM NOT DONE

let
  n = 10;
in
if n then "big" else "small"

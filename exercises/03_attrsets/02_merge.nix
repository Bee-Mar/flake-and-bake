# LESSON: `//` merges attrsets, right side wins — but it is SHALLOW.
#   { a = { x = 1; }; } // { a = { y = 2; }; }  →  { a = { y = 2; }; }  (x is GONE)
# For deep merges nixpkgs uses lib.recursiveUpdate.
#
# TASK: Predict the results. Replace each ??? with the value you expect
# (the checker knows the truth). Expected shape:
#   { winner = ...; shallow = ...; }

# I AM NOT DONE

let
  merged = { a = 1; b = 2; } // { b = 20; c = 30; };
  nested = { cfg = { debug = true; port = 80; }; } // { cfg = { port = 8080; }; };
in
{
  # what is merged.b?
  winner = "???";
  # does nested.cfg still have `debug`? Answer with nested.cfg itself:
  shallow = "???";
}

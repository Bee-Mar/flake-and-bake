# LESSON: builtins.foldl' reduces a list: foldl' op initial list.
#   foldl' (acc: x: acc + x) 0 [ 1 2 3 ]  →  6
# This is how you sum, merge attrsets, build strings... it's everywhere in
# module-system internals.
#
# TASK: Use foldl' to merge this list of attrsets into ONE set (later
# entries win). Expected: { curl = "8.0"; git = "2.44"; jq = "1.7"; }

# I AM NOT DONE

let
  fragments = [
    { curl = "7.9"; }
    { git = "2.44"; jq = "1.7"; }
    { curl = "8.0"; }
  ];
in
fragments   # foldl' with // and an empty starting set

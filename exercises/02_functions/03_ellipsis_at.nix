# LESSON: A destructuring function REJECTS unexpected attrs unless you add
# `...`:      { name, ... }: ...        # extra attrs allowed
# An @-pattern captures the WHOLE attrset too:
#   args@{ name, ... }: ...             # args.anything is reachable
#
# TASK: Fix `tag` so it accepts extra attributes and uses the @-pattern to
# count ALL attrs passed in. Expected result: "bake has 3 attrs".

# I AM NOT DONE

let
  tag = { name }: "${name} has ??? attrs";
in
tag { name = "bake"; version = "2.0"; license = "mit"; }
# hint: builtins.length (builtins.attrNames args)

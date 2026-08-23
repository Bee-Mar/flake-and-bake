# LESSON: `inherit x;` inside an attrset is shorthand for `x = x;` — it pulls
# a binding from the surrounding scope into the set. `inherit (src) a b;`
# pulls a and b out of another attrset src.
#
# TASK: Use inherit (both forms) so this evaluates to
#   { version = "1.0"; license = "mit"; name = "bake"; }

# I AM NOT DONE

let
  version = "1.0";
  meta = { license = "mit"; name = "bake"; };
in
{
  # inherit version from scope, and license + name from meta
}

# LESSON: Attrset values normally can't see their sibling attrs. `rec`
# changes that:
#   rec { a = 1; b = a + 1; }
# nixpkgs derivations use this constantly: rec { pname = "x"; version = "2";
# src = fetchurl { url = "https://.../${pname}-${version}.tar.gz"; ... }; }
#
# TASK: Make this evaluate to { pname = "bake"; version = "1.2";
#   tarball = "bake-1.2.tar.gz"; } — currently it fails with undefined
#   variable errors.

# I AM NOT DONE

{
  pname = "bake";
  version = "1.2";
  tarball = "${pname}-${version}.tar.gz";
}

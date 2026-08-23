# LESSON: The fixpoint: feed a function its OWN result.
#   fix = f: let result = f result; in result;
# Only possible because of laziness! `rec { ... }` is sugar for this, and
# the entire nixpkgs package set is literally `fix (self: all-packages)` —
# which is why overlays can splice themselves in.
#
# TASK: Implement fix. Expected:
#   { pname = "bake"; version = "2.0"; tarball = "bake-2.0.tar.gz"; }

# I AM NOT DONE

let
  fix = f: null;   # implement me

  package = self: {
    pname = "bake";
    version = "2.0";
    tarball = "${self.pname}-${self.version}.tar.gz";
  };
in
fix package

# LESSON: Now build the overlay mechanism YOURSELF. `extends` wires an
# overlay into a fixpoint:
#
#   extends = overlay: base: final:
#     let prev = base final;
#     in prev // overlay final prev;
#
# fix (extends overlay base) gives the overlay both views: `final` (the
# post-overlay fixpoint — for dependencies) and `prev` (base's output — for
# the thing you're changing). Chapter 07 was using exactly this machinery.
#
# TASK: Implement extends. Expected:
#   { pname = "bake"; version = "3.0"; tarball = "bake-3.0.tar.gz"; }
# Note the overlay only bumps version — tarball updating to 3.0 proves that
# base's tarball sees the FINAL fixpoint. That's the magic.

# I AM NOT DONE

let
  fix = f: let result = f result; in result;

  extends = overlay: base: base;   # implement me (see lesson)

  base = final: {
    pname = "bake";
    version = "2.0";
    tarball = "${final.pname}-${final.version}.tar.gz";
  };

  overlay = final: prev: {
    version = "3.0";
  };
in
fix (extends overlay base)

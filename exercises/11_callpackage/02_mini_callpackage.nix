# LESSON: nixpkgs' callPackage in one line: look at what the function ASKS
# for, grab exactly those attrs from the big package scope, call it.
#
#   callPackage = f: extra:
#     f (builtins.intersectAttrs (builtins.functionArgs f) scope // extra);
#
# intersectAttrs keeps only scope's attrs whose NAMES appear in the first
# set. That's the whole trick behind `callPackage ./mypkg.nix { }`.
#
# TASK: Implement callPackage below.
# Expected: "flour + butter (fresh)"

# I AM NOT DONE

let
  scope = {
    flour = "flour";
    butter = "butter";
    sugar = "sugar";     # not requested — must NOT be passed!
    yeast = "yeast";
  };

  mkPastry = { flour, butter, freshness ? "stale" }:
    "${flour} + ${butter} (${freshness})";

  callPackage = f: extra: f extra;   # implement me (see lesson)
in
callPackage mkPastry { freshness = "fresh"; }

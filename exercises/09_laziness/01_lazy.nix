# LESSON: Nix is LAZY — nothing evaluates until something demands its value.
# An attrset can happily contain `boom = throw "..."` as long as nobody looks
# at boom. This is why nixpkgs can define 100k packages: only what you
# reference gets evaluated.
#
# The demand-forcers: builtins.seq a b (forces a, returns b) and
# builtins.deepSeq (forces a RECURSIVELY). deepSeq on a set containing a
# throw... boom.
#
# TASK: This should evaluate to 42, but something is forcing the bomb.

# I AM NOT DONE

let
  attrs = {
    safe = 42;
    boom = throw "you looked at me!";
  };
in
builtins.deepSeq attrs attrs.safe

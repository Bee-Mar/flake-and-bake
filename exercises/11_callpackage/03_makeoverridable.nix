# LESSON: `.override` changes a package's INPUTS (the args callPackage fed
# it); `.overrideAttrs` changes the derivation's BUILD attrs. Two different
# layers! `.override` exists because callPackage wraps functions with
# lib.makeOverridable — which you can use yourself:
#
#   f' = lib.makeOverridable f;
#   (f' { a = 1; }).override { a = 2; }   # re-calls f with updated args
#
# Caveat: makeOverridable attaches .override AS AN ATTR of the result — so
# the wrapped function must return an ATTRSET (derivations are attrsets,
# which is why this works on packages).
#
# TASK: Make mkGreeting overridable and use .override to turn on loud mode
# WITHOUT touching the original call. Expected: "HELLO, NIX"

# I AM NOT DONE

{ lib, ... }:
let
  mkGreeting = { name, loud ? false }: {
    text = if loud then "HELLO, ${lib.toUpper name}" else "hello, ${name}";
  };

  quiet = mkGreeting { name = "nix"; };   # wrap mkGreeting with makeOverridable
in
quiet.text   # should become: (quiet.override { loud = true; }).text

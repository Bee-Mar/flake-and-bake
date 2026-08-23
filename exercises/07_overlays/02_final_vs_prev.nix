# LESSON: final vs prev is THE overlay gotcha.
#   - Reference the package you're MODIFYING via `prev` (else you define
#     hello in terms of the final hello = in terms of itself = infinite
#     recursion).
#   - Reference DEPENDENCIES via `final` (so later overlays' versions win).
#
# TASK: This composition is broken: overlayB refers to `final.greeting`
# while DEFINING greeting — infinite recursion! Fix overlayB to build on
# prev's value instead. Expected: "hello, then loudly, then proudly".

# I AM NOT DONE

{ pkgs, lib }:
let
  overlayA = final: prev: {
    greeting = "hello, then loudly";
  };
  overlayB = final: prev: {
    greeting = final.greeting + ", then proudly";
  };
  composed = lib.composeManyExtensions [ overlayA overlayB ];
  result = lib.fix (lib.extends composed (final: { greeting = "hello"; }));
in
result.greeting

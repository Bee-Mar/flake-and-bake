# LESSON: An overlay is a function `final: prev: { ... }` that modifies a
# package set. `prev` is the set BEFORE your overlay (use it to reference
# the package you're changing); `final` is the set AFTER all overlays (use
# it for dependencies, so other overlays' changes are visible to you).
#
#   import nixpkgs { overlays = [ myOverlay ]; }
#
# This exercise evaluates the overlaid package's meta — no build needed.
#
# TASK: Write an overlay that replaces hello's meta.description with
# "baked with an overlay". Expected eval result: "baked with an overlay".

# I AM NOT DONE

{ pkgs, ... }:
let
  overlay = final: prev: {
    # hello = prev.hello.overrideAttrs (old: { meta = old.meta // { ... }; });
  };
  overlaid = pkgs.extend overlay;   # pkgs.extend applies one overlay
in
overlaid.hello.meta.description

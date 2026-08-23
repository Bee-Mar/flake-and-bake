{ pkgs, ... }:
let
  overlay = final: prev: {
    hello = prev.hello.overrideAttrs (old: {
      meta = old.meta // { description = "baked with an overlay"; };
    });
  };
  overlaid = pkgs.extend overlay;
in
overlaid.hello.meta.description

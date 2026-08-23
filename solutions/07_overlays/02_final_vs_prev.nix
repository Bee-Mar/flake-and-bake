{ pkgs, lib }:
let
  overlayA = final: prev: {
    greeting = "hello, then loudly";
  };
  overlayB = final: prev: {
    greeting = prev.greeting + ", then proudly";
  };
  composed = lib.composeManyExtensions [ overlayA overlayB ];
  result = lib.fix (lib.extends composed (final: { greeting = "hello"; }));
in
result.greeting

{ lib, ... }:
let
  mkGreeting = { name, loud ? false }: {
    text = if loud then "HELLO, ${lib.toUpper name}" else "hello, ${name}";
  };

  quiet = lib.makeOverridable mkGreeting { name = "nix"; };
in
(quiet.override { loud = true; }).text

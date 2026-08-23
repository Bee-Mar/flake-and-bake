# LESSON: STRING CONTEXTS — the invisible magic holding Nix together.
# When you interpolate a derivation into a string, the string carries a
# hidden "context" recording that dependency. Using that string in another
# derivation makes Nix build the dependency first:
#
#   pkgs.runCommand "x" { } ''${pkgs.hello}/bin/hello > $out''
#                              ^^^^^^^^^^^^ hello becomes a build input,
#                              purely because its outPath appears in the text!
#
# Hardcoding "/nix/store/...-hello" as a plain string has NO context — the
# path may not exist in the sandbox, and Nix won't build it for you.
#
# TASK: This build fails because someone "helpfully" hardcoded a store path.
# Replace it with a proper interpolation of pkgs.hello.
# Check greps $out for "Hello, world".

# I AM NOT DONE

{ pkgs, ... }:
pkgs.runCommand "greeting" { } ''
  /nix/store/00000000000000000000000000000000-hello/bin/hello > $out
''

# LESSON: builtins.functionArgs inspects a destructuring function's
# signature:
#   functionArgs ({ pname, version ? "1.0" }: ...)
#     → { pname = false; version = true; }     # true = "has a default"
# This reflection is what lets nixpkgs' callPackage figure out which
# dependencies a package function wants, automatically.
#
# TASK: Fill in the answers.
# Expected: { args = { stdenv = false; fetchurl = false; enableGui = true; };
#             wantsStdenv = true; }

# I AM NOT DONE

let
  mkPackage = { stdenv, fetchurl, enableGui ? false }: "...";
in
{
  args = { };                        # functionArgs of mkPackage
  wantsStdenv = false;               # does mkPackage take stdenv? (use ?)
}

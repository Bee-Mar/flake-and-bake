# LESSON: `inherit` exists to remove repetition when building attrsets.
# Without it, carrying outside values in under the same name looks like:
#
#   {
#     version = version;        # left: attr being CREATED in this set
#     license = meta.license;   # right: a LOOKUP in the surrounding scope
#     name = meta.name;
#   }
#
# `x = x;` is legal (the two sides live in different worlds) but noisy.
# inherit is sugar for exactly that:
#
#   inherit version;            ==  version = version;
#   inherit a b c;              ==  a = a;  b = b;  c = c;
#   inherit (meta) license;     ==  license = meta.license;
#                                   ^ the (parens) name a SOURCE ATTRSET to
#                                     pull from instead of the enclosing scope
#
# One rule to remember: names always come across UNCHANGED. inherit cannot
# rename — `pkgVersion = version;` must be written longhand.
#
# You'll see this everywhere in real Nix:
#   inherit (pkgs) stdenv fetchurl;      # package files
#   inherit (config.services.foo) enable; # NixOS modules
# It's the explicit, tool-friendly alternative to `with` (chapter 09 covers
# why `with` is the risky cousin).
#
# TASK: Use inherit (both forms) so this evaluates to
#   { version = "1.0"; license = "mit"; name = "bake"; }

# I AM NOT DONE

let
  version = "1.0";
  meta = {
    license = "mit";
    name = "bake";
  };
in
{
  # inherit version from scope, and license + name from meta
}

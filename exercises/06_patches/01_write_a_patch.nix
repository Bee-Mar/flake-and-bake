# LESSON: Patches let you fix a package's source without forking it.
# mkDerivation applies `patches = [ ./some.patch ]` during the patchPhase
# with `patch -p1` (paths in the patch are relative to the source root, with
# one leading component stripped — hence the conventional a/ and b/ prefixes).
#
# Make a patch the honest way:
#   cp -r muffin muffin.orig
#   $EDITOR muffin/recipe.txt          # change blueberry -> chocolate chip
#   diff -ru muffin.orig muffin > fix-flavor.patch   (run inside this dir!)
# ...then edit the paths in the patch header to a/recipe.txt and b/recipe.txt.
#
# TASK: The vendored source in ./muffin has the WRONG flavor. Create
# fix-flavor.patch in this directory (06_patches/) so the built
# $out/recipe.txt says "chocolate chip". Don't edit ./muffin itself — that's
# cheating (and the checker uses the pristine copy from the store anyway).

# I AM NOT DONE

{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "muffin-recipe";
  src = ./muffin;

  patches = [ ./fix-flavor.patch ];

  dontBuild = true;
  installPhase = ''
    mkdir -p $out
    cp recipe.txt $out/
  '';
}

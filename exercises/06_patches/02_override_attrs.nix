# LESSON: You rarely build packages from scratch — you tweak existing ones.
# Every nixpkgs package has .overrideAttrs:
#   pkg.overrideAttrs (old: { patches = (old.patches or []) ++ [ ./x.patch ]; })
# `old` is the original argument set; ALWAYS append to old.patches rather
# than replacing it, or you silently drop upstream's patches.
#
# TASK: Take pkgs.hello and use overrideAttrs to add a postInstall hook that
# writes a file $out/baked containing "overridden". (Same mechanism as
# adding patches — we're just avoiding a slow rebuild-from-source here by
# not touching the compile.)   ...actually hello is tiny; this WILL compile
# it. First real build — grab a coffee the first time.

# I AM NOT DONE

{ pkgs, ... }:
pkgs.hello.overrideAttrs (old: {
  # add: postInstall = (old.postInstall or "") + ''...write $out/baked...'';
})

# LESSON: stdenv.mkDerivation is the standard package builder. It runs
# phases: unpack → patch → configure → build → install. With no Makefile you
# override the phases yourself. `src` can be a local path — here we vendor a
# tiny program in ./greet/.
#
# TASK: This derivation is broken twice:
#   1. It has no `src` (point it at ./greet).
#   2. installPhase never installs the script.
# The check runs $out/bin/greet and expects it to print "hello from the oven".

# I AM NOT DONE

{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "greet";
  version = "1.0";

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/bin
    # copy the `greet` script from the unpacked src into $out/bin
    # and make it executable (install -m755 is your friend)
  '';
}

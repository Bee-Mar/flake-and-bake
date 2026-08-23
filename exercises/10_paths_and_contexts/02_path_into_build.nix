# LESSON: Interpolating a PATH into a build script stores the file and
# splices in its /nix/store path — that's how you get local files into a
# sandboxed build (the sandbox can't see your working directory!).
#
#   pkgs.runCommand "x" { } ''cp ${./data.txt} $out''
#
# TASK: The build below tries to read ./secret-ingredient.txt directly from
# the source tree — which the sandbox can't see, so the path never resolves.
# Fix it by interpolating the path. Check greps $out for the ingredient.

# I AM NOT DONE

{ pkgs, ... }:
pkgs.runCommand "ingredient" { } ''
  cp ./secret-ingredient.txt $out
''

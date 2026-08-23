# LESSON: Underneath mkDerivation, runCommand, and every wrapper lives ONE
# primitive: builtins.derivation. It takes name, system, builder, args —
# everything else (phases, $PATH, stdenv) is nixpkgs convention layered on
# top. With a raw derivation there is NO shell environment: you name an
# executable and its argv. $out is just an env var, and here it's a plain
# file path (nothing mkdirs it for you).
#
# TASK: Complete the raw derivation so it writes "primitive" to $out.
# (bash -c 'echo primitive > $out' — note the builder must be an absolute
# path INTO A DERIVATION so the sandbox can see it... string contexts again!)

# I AM NOT DONE

{ pkgs, ... }:
builtins.derivation {
  name = "raw";
  system = pkgs.stdenv.hostPlatform.system;
  builder = "/bin/bash";        # sandbox can't see this! interpolate pkgs.bash
  args = [ "-c" "true" ];       # ...and actually write $out
}

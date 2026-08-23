{ pkgs, ... }:
builtins.derivation {
  name = "raw";
  system = pkgs.stdenv.hostPlatform.system;
  builder = "${pkgs.bash}/bin/bash";
  args = [ "-c" "echo primitive > $out" ];
}

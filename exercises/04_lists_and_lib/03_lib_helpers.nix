# LESSON: nixpkgs' `lib` is the standard library you'll lean on daily.
# This exercise file is a FUNCTION — the harness calls it with { pkgs, lib }.
# Handy ones:
#   lib.concatStringsSep ", " [ "a" "b" ]    → "a, b"
#   lib.genAttrs [ "a" "b" ] (n: ...)        → { a = ...; b = ...; }
#   lib.optionalString cond "text"           → "text" or ""
#
# TASK: Fill in the three answers. Expected:
#   { joined = "curl git jq"; ports = { http = "port-http"; ssh = "port-ssh"; };
#     maybe = ""; }

# I AM NOT DONE

{ lib, ... }:
{
  joined = [ "curl" "git" "jq" ];                 # concatStringsSep " "
  ports = [ "http" "ssh" ];                       # genAttrs with (n: "port-${n}")
  maybe = lib.optionalString true "enabled";      # make the condition false
}

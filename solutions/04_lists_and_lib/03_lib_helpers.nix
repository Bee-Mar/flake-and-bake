{ lib, ... }:
{
  joined = lib.concatStringsSep " " [ "curl" "git" "jq" ];
  ports = lib.genAttrs [ "http" "ssh" ] (n: "port-${n}");
  maybe = lib.optionalString false "enabled";
}

let
  mkPackage = { stdenv, fetchurl, enableGui ? false }: "...";
in
{
  args = builtins.functionArgs mkPackage;
  wantsStdenv = builtins.functionArgs mkPackage ? stdenv;
}

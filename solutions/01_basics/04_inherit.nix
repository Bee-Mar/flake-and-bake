let
  version = "1.0";
  meta = { license = "mit"; name = "bake"; };
in
{
  inherit version;
  inherit (meta) license name;
}

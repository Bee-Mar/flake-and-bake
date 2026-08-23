let
  describe = { name, version ? "0.1" }: "${name}-${version}";
in
{
  a = describe { name = "bake"; version = "2.0"; };
  b = describe { name = "oven"; };
}

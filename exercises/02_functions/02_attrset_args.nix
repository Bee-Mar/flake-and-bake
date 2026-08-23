# LESSON: The idiomatic Nix "keyword arguments" pattern destructures an
# attrset: `{ name, version }: ...`. Defaults use `?`:
#   { name, version ? "1.0" }: ...
# This is the shape of nearly every nixpkgs package function!
#
# TASK: Give `describe` a default version of "0.1" so BOTH calls work,
# producing { a = "bake-2.0"; b = "oven-0.1"; }.

# I AM NOT DONE

let
  describe = { name, version }: "${name}-${version}";
in
{
  a = describe { name = "bake"; version = "2.0"; };
  b = describe { name = "oven"; };
}

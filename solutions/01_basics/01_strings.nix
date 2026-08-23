let
  name = "nix";
in
{
  greeting = "I am learning ${name}";
  concat = "flake" + "-and-bake";
  answer = "the answer is ${toString 42}";
}

# LESSON: Nix has two string syntaxes:
#   "double quoted"        — supports \n escapes and ${...} interpolation
#   ''indented strings''   — great for multi-line; strips common leading whitespace
# Interpolation splices any *string-valued* expression: "Hi ${name}!"
# (Numbers must be converted first: toString 42.)
#
# TASK: Fill in each answer so the attrset below matches what the checker
# expects. Run `bake` to see the expected values when you get one wrong.

# I AM NOT DONE

let
  name = "nix";
in
{
  # Use interpolation so this evaluates to "I am learning nix"
  greeting = "I am learning ???";

  # Concatenate with + so this evaluates to "flake-and-bake"
  concat = "flake" + "???";

  # toString the number 42 so this evaluates to "the answer is 42"
  answer = "the answer is ${"???"}";
}

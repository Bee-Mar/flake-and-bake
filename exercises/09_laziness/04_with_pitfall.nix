# LESSON: `with set; expr` brings set's attrs into scope — but with the
# LOWEST priority: explicit bindings (let, function args) always win, and a
# nested `with` beats an outer one. This makes `with pkgs;` code fragile and
# hard for tools to analyze; prefer `inherit (pkgs) foo bar;` in real code.
#
# TASK: Predict what each expression evaluates to.
# The checker knows. No fair running nix repl... actually, totally fair —
# learning `nix repl` is the point of chapter 13.

# I AM NOT DONE

let
  x = 1;
  scope1 = { x = 2; y = 20; };
  scope2 = { y = 30; };
in
{
  # let-bound x vs with-provided x — who wins?
  a = with scope1; x;

  # nested with vs outer with for y?
  b = with scope1; with scope2; y;

  answerKey = "replace a and b's EXPRESSIONS' results with literal numbers if unsure";
}
# Expected shape: { a = ...; b = ...; answerKey = "done"; }
# (also change answerKey to "done" once you understand why)

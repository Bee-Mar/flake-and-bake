# LESSON: Debugging toolkit:
#   nix repl          then  :lf .   (load flake)   :b expr   (build)
#   nix eval --show-trace ...        full evaluation trace
#   nix why-depends A B              why does A's closure contain B?
#   builtins.trace / lib.traceVal    printf debugging (chapter 09)
#
# Error-reading practice. For each real error message below, pick which
# code snippet caused it — answer "a", "b", or "c".
#
# ── Q1 ─────────────────────────────────────────────────────────
#   error: infinite recursion encountered
#   a) let x = y; y = x; in x
#   b) rec { a = 1; b = a; }
#   c) builtins.foldl' (x: y: x) 0 [1 2 3]
#
# ── Q2 ─────────────────────────────────────────────────────────
#   error: cannot coerce an integer to a string
#   a) "port: ${toString 80}"
#   b) "port: ${80}"
#   c) 80 + 1
#
# ── Q3 ─────────────────────────────────────────────────────────
#   error: function 'anonymous lambda' called with unexpected argument 'vebrose'
#   a) ({ verbose ? false }: verbose) { }
#   b) ({ verbose ? false, ... }: verbose) { vebrose = true; }
#   c) ({ verbose ? false }: verbose) { vebrose = true; }
#
# TASK: Answer all three. (Try each snippet in `nix repl` — that IS the
# exercise.)

# I AM NOT DONE

{
  q1 = "?";
  q2 = "?";
  q3 = "?";
}

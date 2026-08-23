# LESSON: Missing-attribute tools:
#   attrs.a.b or fallback   — fallback if ANY step of the path is missing
#   attrs ? a               — true/false existence test (also: attrs ? a.b)
# `or` binds to attribute SELECTION only — `f x or y` parses as `f (x or y)`
# ...surprise! Parenthesize: `(f x) or y` is a syntax error; or needs a select.
#
# TASK: Fill in the answers.
# Expected: { port = 8080; hasDebug = false; fallbackChain = "default"; }

# I AM NOT DONE

let
  config = { server = { port = 8080; }; };
in
{
  # select config.server.port, with 80 as the fallback
  port = 80;

  # does config.server have a `debug` attr? (use ?)
  hasDebug = true;

  # config.client.theme doesn't exist at ANY level — one `or` handles it
  fallbackChain = config.client.theme;
}

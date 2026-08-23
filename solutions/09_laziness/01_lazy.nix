let
  attrs = {
    safe = 42;
    boom = throw "you looked at me!";
  };
in
attrs.safe
